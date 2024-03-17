import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/view/screens/home_screen.dart';

import '../utils/colors.dart';

class NoteScreen extends StatelessWidget {
  final TextEditingController _headingController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  NoteScreen({super.key});

  // Save note
  void SaveNote() async {}

  void saveNote() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[600],
        title: const Text(
          'W R I T E',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: secondaryColor),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        onPressed: () {
          // Save the note
          saveNote();
          // Navigate back to the home page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _headingController,
              decoration: InputDecoration(
                labelText: 'Heading',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
              ),
              maxLines: null,
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
