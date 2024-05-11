import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/core/constatnt/crud.dart';

class FirebaseAuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> signUPwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("some error eccoured signn up ------- $e");
    }
    return null;
  }

  Future<User?> signInwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("some error eccoured");
    }
    return null;
  }

  viewUsers(String collection) async {
    Crud crud = Crud();
    var response = await crud.getData(collection);
    return response.fold((l) => l, (r) => r);
  }
}
