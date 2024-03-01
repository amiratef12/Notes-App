import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/home_notes_view_body.dart';

class HomeNotesView extends StatelessWidget {
  const HomeNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const HomeNotesViewBody(),
    );
  }
}
