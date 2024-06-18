import 'package:evlow_foodies/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Convertit un objet User? de Firebase en AppUser? de l'application
  AppUser? _userFromFirebaseUser(User? user) {
    // Crée un AppUser si user n'est pas null
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // Authentification par email et mot de passe
  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // Authentification avec Firebase
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Utilisateur authentifié
      User? user = result.user;
      // Convertit et retourne l'AppUser correspondant
      return _userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  // Enregistrement par email et mot de passe
  Future<AppUser?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // Création d'un nouvel utilisateur avec Firebase
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Nouvel utilisateur créé
      User? user = result.user;
      // Convertit et retourne l'AppUser correspondant
      return _userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  // Déconnexion de l'utilisateur
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
      // Déconnexion avec Firebase
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  // Flux de changement d'état d'authentification
  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    // Écoute les changements d'état d'authentification et mappe chaque User? à un AppUser?
  }
}
