import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubits/notes/notes_cubit.dart';
import 'package:note/models/note_model.dart';
import 'package:note/views/widgets/colors_listview.dart';
import 'package:note/views/widgets/custom_appbar.dart';
import 'package:note/views/widgets/custom_textfield.dart';

import 'edit_note_color.dart';

class EditNoteViewBody extends StatefulWidget {
  NoteModel note;

  EditNoteViewBody({super.key, required this.note});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            CustomAppBar(
              title: "Edit Note",
              icon: Icons.done,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.save();
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              hintText: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: widget.note.content,
              maxLines: 5,
              onChanged: (value) {
                content = value;
              },
            ),
             EditNotesColors(note: widget.note,),
          ],
        ),
      ),
    );
  }
}
