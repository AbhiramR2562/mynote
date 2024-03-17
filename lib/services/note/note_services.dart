import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String title;
  final String content;
  final Timestamp timestamp;

  Note({
    required this.title,
    required this.content,
    required this.timestamp,
  });
}
