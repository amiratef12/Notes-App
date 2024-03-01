import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Features/home/data/models/note_model.dart';
import 'package:notes_app/Features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/Features/home/presentation/manager/add_note_cubit/add_note_state.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/colors_list_view.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_button.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 30,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is AddNoteLoading ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var currentDate = DateTime.now();
                        var formattedCurrentDate =
                            DateFormat.yMd().format(currentDate);
                        var noteModel = NoteModel(
                            title: title!,
                            subTitle: subTitle!,
                            date: formattedCurrentDate,
                            color: Colors.blue.value);
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
                      }
                    },
                  );
                },
              ))
        ],
      ),
    );
  }
}
