import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../models/note_model.dart';
import 'color_item.dart';

class EditNotesColors extends StatefulWidget {
  final NoteModel note;

  EditNotesColors({required this.note});

  @override
  State<EditNotesColors> createState() => _EditNotesColorsState();
}

class _EditNotesColorsState extends State<EditNotesColors> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kNoteColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    widget.note.color = kNoteColors[index].value;
                    setState(() {});
                  },
                  child: ColorItem(
                    isActive: currentIndex == index,
                    color: kNoteColors[index],
                  )),
            );
          },
          itemCount: kNoteColors.length,
          scrollDirection: Axis.horizontal),
    );
  }
}