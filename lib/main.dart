import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';

import 'core/di/di.dart';
import 'core/model/note_model.dart';
import 'core/utils/theme.dart';
import 'features/bottom_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'features/bottom_navigation/presentation/views/bottom_navigation.dart';
import 'features/home_screen/presentation/cubit/note_cubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initHive();

  /// Initialize Dependency Injection (GetIt)
  await init();

  runApp(const MyApp());
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notesBox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I<NoteCubit>()..loadNotes()),
        BlocProvider(create: (context) => BottomNavigationCubit()), // Bottom Navigation Cubit
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NoteFlow',
        theme: AppTheme.lightTheme,
        home: HomeScreen(), // Start with Bottom Navigation
      ),
    );
  }
}
