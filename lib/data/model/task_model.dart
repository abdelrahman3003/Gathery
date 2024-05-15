import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String user;
  final String taskName;
  final List<String> optiona;
  final List<String> optionaFinished;
  final String event;
  final double sliderValue;
  TaskModel({
    required this.user,
    required this.taskName,
    required this.optiona,
    required this.event,
    required this.optionaFinished,
    required this.sliderValue,
  });

  factory TaskModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    List<String> options = List<String>.from(data['option']);
    List<String> optionsFinshed = List<String>.from(data['optionFinished']);
    return TaskModel(
      event: doc['event'],
      taskName: doc['title'],
      user: doc['member'],
      optiona: options,
      optionaFinished: optionsFinshed,
      sliderValue: doc['sliderValue']
    );
  }
}
