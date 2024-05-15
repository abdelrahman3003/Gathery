import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  int following;
  int follower;
  int leader;
  int participant;

  UserModel({
    required this.name,
    required this.email,
    required this.following,
    required this.follower,
    required this.leader,
    required this.participant,
  });
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      name: doc['name'],
      email: doc['email'],
      follower: doc['follower'],
      following: doc['following'],
      leader: doc['leader'],
      participant: doc['participant'],
    );
  }
}
