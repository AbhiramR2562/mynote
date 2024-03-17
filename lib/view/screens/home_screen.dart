import 'package:flutter/material.dart';
import 'package:my_notes/services/authentication/auth_service.dart';
import 'package:my_notes/view/screens/note_screen.dart';
import 'package:my_notes/view/screens/profile_screen.dart';
import 'package:my_notes/view/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');
  HomeScreen({super.key});

  void logoutUSer() {
    // get auth services
    final auth = AuthService();
    auth.signOut();
  }

  Future<void> createNote() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[600],
        title: const Text(
          'MY NOTE',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: secondaryColor),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Logo
                const DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.note_alt_outlined,
                      size: 50,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("P R O F I L E"),
                  leading: const Icon(Icons.person),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                  },
                ),
              ],
            ),
            // Logout
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: ListTile(
                title: const Text("L O G O U T"),
                leading: const Icon(Icons.logout),
                onTap: logoutUSer,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[600],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NoteScreen()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: notesCollection.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  // return the Note Saved
                  return Container();
                });
          }
          return Container();
        },
      ),
    );
  }
}


/* 
if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            final notes = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return Note(
                title: data['title'],
                content: data['content'],
                timestamp: data['timestamp'],
              );
            }).toList();
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index].title),
                  subtitle: Text(notes[index].timestamp.toDate().toString()),
                );
              },
            );
*/