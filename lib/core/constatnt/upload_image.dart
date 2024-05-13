import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage firebaseStorage = FirebaseStorage.instance;
Future<String?> uploadImageToFirestorage(
    String imageName, Uint8List file) async {
  try {
    Reference reference = firebaseStorage
        .ref()
        .child("$imageName${DateTime.now().millisecondsSinceEpoch.toString()}");
    UploadTask uploadTask = reference.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } on Exception catch (e) {
    print("error ================================ $e");
    return null;
  }
}
