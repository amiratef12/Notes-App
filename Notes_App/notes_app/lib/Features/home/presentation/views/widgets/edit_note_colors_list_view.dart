import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/data/models/note_model.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/colors_list_view.dart';
import 'package:notes_app/constants.dart';

class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    widget.note.color = kColors[index].value;
                    setState(() {});
                  },
                  child: ColorItem(
                    color: kColors[index],
                    isActive: currentIndex == index,
                  )),
            );
          }),
    );
  }
}
