import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final DateTime timestamp;

  //method
  Function(bool?)? onChanged;

  Function(BuildContext)? deleteFunction;

  NoteTile({
    super.key,
    required this.title,
    required this.onChanged,
    required this.deleteFunction,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            // Task name

            Text(
              title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
                height: 8), // Adding some space between title and timestamp
            // Timestamp
            Text(
              'Timestamp: ${timestamp.toString()}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
