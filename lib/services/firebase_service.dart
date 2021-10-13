import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/services/database_service.dart';

class FirebaseService implements DataBaseService {
  final _googleSigin = GoogleSignIn();
  final _authInstance = locator<FirebaseAuth>();
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
}
