import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/notes_list_view.dart';

class HomeNotesViewBody extends StatefulWidget {
  const HomeNotesViewBody({super.key});

  @override
  State<HomeNotesViewBody> createState() => _HomeNotesViewBodyState();
}

class _HomeNotesViewBodyState extends State<HomeNotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: NotesListView(),
    );
  }
}
