import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:upc_app/constants/collections_docs.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/models/notification.dart';
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
    await _googleSigin.signOut();
    _authInstance.signOut();
  }

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

  Stream<DocumentSnapshot> isMemberRegisteredService(Service serv, Member mem) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.services)
        .collection(Collection.churchservices)
        .doc(serv.id)
        .collection(Collection.attendees)
        .doc(mem.uid)
        .snapshots();
  }

  Future registerMemberService(Service serv, Member mem) async {
    await _addServicetoMember(serv, mem);
    return _addMembertoService(serv, mem);
  }

  Future _addMembertoService(Service serv, Member mem) async {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.services)
        .collection(Collection.churchservices)
        .doc(serv.id)
        .collection(Collection.attendees)
        .doc(mem.uid)
        .set(mem.toJson());
  }

  Future _addServicetoMember(Service serv, Member mem) async {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.members)
        .collection(Collection.churchmembers)
        .doc(mem.uid)
        .collection(Collection.registeredServices)
        .doc(serv.id)
        .set(serv.tojson());
  }

  Future addService(Service serv) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.services)
        .collection(Collection.churchservices)
        .doc(serv.id)
        .set(serv.tojson());
  }

  Future addInfectedService(Member mem) async {
    QuerySnapshot allserv = await _firestoreInstance
        .collection(Collection.church)
        .doc(Document.members)
        .collection(Collection.churchmembers)
        .doc(mem.uid)
        .collection(Collection.registeredServices)
        .get();
    // print("got registered serv ${allserv.docs.length}");
    allserv.docs.forEach((element) async {
      Map<String, dynamic> dat = element.data() as Map<String, dynamic>;
      await addServhelper(Service.fromJson(dat));
    });

    // all into infected services collection
  }

  Future<void> addServhelper(Service serv) {
    // print("added service\n ${serv.tojson()}");

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
        .doc(mem.uid)
        .set(mem.toJson());
  }

  Future<void> addAdmin(Member mem) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.admin)
        .collection(Collection.churchadmin)
        .doc(mem.uid)
        .set(mem.toJson());
  }

  Future<bool> verifyPassword(String pass) async {
    QuerySnapshot isvalid = await _firestoreInstance
        .collection(Collection.church)
        .where(
          "adminPassword",
          isEqualTo: pass,
        )
        .get();

    return isvalid.docs.length != 0;
  }

  Future<void> addNotfication(Notifications note) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.notifications)
        .collection(Collection.churchNotification)
        .doc(note.id)
        .set(note.toJson());
  }

// Covid Alert
  Stream<QuerySnapshot> x(String ui) {
    return _firestoreInstance
        .collectionGroup("attendees")
        .where("firstName", isEqualTo: "Patrick2")
        .snapshots();
  }

//End Covid Alert
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

  Stream<QuerySnapshot> getInfecServices() {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.iservices)
        .collection(Collection.infectedServices)
        .snapshots();
  }

  Stream<DocumentSnapshot> isMemberRegistered(String uid) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.members)
        .collection(Collection.churchmembers)
        .doc(uid)
        .snapshots();
  }

  Stream<DocumentSnapshot> isMemberAdmin(String uid) {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.admin)
        .collection(Collection.churchadmin)
        .doc(uid)
        .snapshots();
  }

  Stream<QuerySnapshot> getNotification() {
    return _firestoreInstance
        .collection(Collection.church)
        .doc(Document.notifications)
        .collection(Collection.churchNotification)
        .snapshots();
  }
}
