import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/views/widgets/custom_note_item.dart';

import '../../cubits/notes/notes_cubit.dart';
import '../../models/note_model.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel>notes =BlocProvider.of<NotesCubit>(context).noteModel??[] ;
        return ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: NoteItem(note: notes[index],),
          );
        }, itemCount: notes.length,);
      },
    );
  }
}
