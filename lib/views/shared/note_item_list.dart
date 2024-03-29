import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_setup_app/controller/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo_setup_app/controller/cubits/notes_cubit/notes_state_cubit.dart';
import 'package:todo_setup_app/models/note_model.dart';
import 'package:todo_setup_app/views/shared/note_item.dart';

class NoteItemList extends StatelessWidget {
  const NoteItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context, state) {
        List<NoteModel> notes=BlocProvider.of<NotesCubit>(context).notes??[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context,index){
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child:  NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}