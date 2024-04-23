import 'package:flutter/material.dart';
import 'package:note/models/note_model.dart';
import 'package:note/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {


  NoteModel note;


  EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(note:note),
    );
  }
}
