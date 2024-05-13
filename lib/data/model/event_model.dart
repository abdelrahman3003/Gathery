import 'dart:typed_data';

class EventModel {
  final String admin;
  final String title;
  final List<String> members;
  final String startDate;
  final String endDate;
  final Uint8List image;

  EventModel( {
    required this.admin,
    required this.title,
    required this.members,
    required this.startDate,
    required this.endDate,
    required this.image,
  });
}
