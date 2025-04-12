import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/model/note_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../presentation/cubit/note_cubit.dart';
import 'add_notes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<NoteCubit, List<Note>>(
          builder: (context, notes) {
            if (notes.isEmpty) {
              return const Center(child: Text('No notes available. Add some!'));
            }
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(
                      note.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      note.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<NoteCubit>().deleteNote(note.id);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddNotePage(note: note)),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddNotePage()),
              );
            },
            backgroundColor: AppColors.lavender,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
