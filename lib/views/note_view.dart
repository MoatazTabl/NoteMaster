import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note/cubits/add_notes/add_notes_cubit.dart';
import 'package:note/views/widgets/add_note.dart';
import 'package:note/views/widgets/notes_view_body.dart';

import '../cubits/notes/notes_cubit.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        topLeft: Radius.circular(18))),
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => AddNotesCubit(),
                    child: BlocConsumer<AddNotesCubit, AddNotesState>(
                      listener: (context, state) {
                        if (state is AddNotesSuccess) {
                          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                          Navigator.pop(context);
                        }
                        if (state is AddNotesFailure) {
                        }
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery
                              .of(context)
                              .viewInsets
                              .bottom),
                          child: ModalProgressHUD(
                              inAsyncCall:
                              state is AddNotesLoading ? true : false,
                              child: AbsorbPointer(
                                  absorbing:
                                  state is AddNotesLoading ? true : false,
                                  child: const AddNote())),
                        );
                      },
                    ),
                  );
                },
              );
            },
            child: const Icon(Icons.add)),
        body: const NotesViewBody());
  }
}
