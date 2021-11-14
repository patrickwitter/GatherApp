import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:upc_app/constants/collections_docs.dart';
import 'package:upc_app/constants/member_jsonKey.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/database_service.dart';

class FirebaseService implements DataBaseService {
  final _googleSigin = GoogleSignIn();
  final _authInstance = locator<FirebaseAuth>();
  final _firestoreInstance = locator<FirebaseFirestore>();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  @override
  Future loginUser() async {
    final googleUser = await _googleSigin.signIn();

    if (googleUser == null) return;

    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _authInstance.signInWithCredential(credential);
  }

  Future logoutUser() async {
    await _googleSigin.disconnect();
    _authInstance.signOut();
  }

  // String getAdminPass()
  // {
  //   return
  // }
  Future addMember(Member mem) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.members)
        .collection(Collection.churchmembers)
        .doc(mem.uid)
        .set(mem.toJson());
  }

  Future<DocumentSnapshot> getMember() async {
    return await _firestoreInstance
        .collection(Collection.church)
        .doc(Document.members)
        .collection(Collection.churchmembers)
        .doc(_authInstance.currentUser!.uid)
        .get();
  }

  Future<bool> isMemberRegistered(String uid) async {
    DocumentSnapshot mem = await _firestoreInstance
        .collection(Collection.church)
        .doc(Document.members)
        .collection(Collection.churchmembers)
        .doc(uid)
        .get();
    return mem.exists;
  }

  Future registerMemberService(Service serv, Member mem) async {
    await addMembertoService(serv, mem);
    await addServicetoMember(serv, mem);
  }

  Future<void> addMembertoService(Service serv, Member mem) async {
    await _firestoreInstance
        .collection(Collection.church)
        .doc(Document.services)
        .collection(Collection.churchservices)
        .doc(serv.id)
        .collection(Collection.attendees)
        .doc(mem.uid)
        .set({"memberId": mem.uid});
  }

  Future<void> addServicetoMember(Service serv, Member mem) async {
    await _firestoreInstance
        .collection(Collection.church)
        .doc(Document.members)
        .collection(Collection.churchmembers)
        .doc(mem.uid)
        .collection(Collection.registeredServices)
        .doc(serv.id)
        .set({"servId": serv.id});
  }

  Future addService(Service serv) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.services)
        .collection(Collection.churchservices)
        .doc(serv.id)
        .set(serv.tojson());
  }

  Future addInfectedService(Service serv) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.iservices)
        .collection(Collection.infectedServices)
        .doc(serv.id)
        .set(serv.tojson());
  }

  Future addInfectedMember(Member mem) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.imembers)
        .collection(Collection.infectedMembers)
        .doc(MemberKey.uid)
        .set(mem.toJson());
  }

  Stream<QuerySnapshot> getServices() {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.services)
        .collection(Collection.churchservices)
        .snapshots();
  }

  Stream<QuerySnapshot> getMembers() {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.members)
        .collection(Collection.churchmembers)
        .snapshots();
  }

  Stream<QuerySnapshot> getInfecMembers() {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.imembers)
        .collection(Collection.infectedMembers)
        .snapshots();
  }
}
