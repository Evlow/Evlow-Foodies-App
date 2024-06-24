import 'package:evlow_foodies/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Convertit un objet User? de Firebase en UserModel? de l'application
  UserModel? _userFromFirebaseUser(User? user) {
    if (user == null) return null;
    return UserModel(
      uid: user.uid,
      displayName: user.displayName ?? '',
      email: user.email ?? '',
    );
  }

  // Authentification par email et mot de passe
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // Authentification avec Firebase
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Utilisateur authentifié
      User? user = result.user;
      // Convertit et retourne l'UserModel correspondant
      return _userFromFirebaseUser(user);
    } catch (exception) {
      print('Erreur lors de la connexion: $exception');
      return null;
    }
  }

  // Enregistrement par email et mot de passe
  Future<UserModel?> registerWithEmailAndPassword(
      String email, String password, String displayName) async {
    try {
      // Création d'un nouvel utilisateur avec Firebase
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Mettre à jour le profil de l'utilisateur avec displayName
      User? user = result.user;
      if (user != null) {
        await user.updateDisplayName(displayName);
      }
      // Convertit et retourne l'UserModel correspondant
      return _userFromFirebaseUser(user);
    } catch (exception) {
      print('Erreur lors de l\'inscription: $exception');
      return null;
    }
  }

  // Déconnexion de l'utilisateur
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      // Déconnexion avec Firebase
    } catch (exception) {
      print('Erreur lors de la déconnexion: $exception');
    }
  }

  // Flux de changement d'état d'authentification
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    // Écoute les changements d'état d'authentification et mappe chaque User? à un UserModel?
  }
}
