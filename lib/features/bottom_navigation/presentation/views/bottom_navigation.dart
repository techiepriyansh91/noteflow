import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/bottom_navigation_cubit.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: context.read<BottomNavigationCubit>().pages[selectedIndex],


          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            color: AppColors.ivory,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: selectedIndex == 0 ? Colors.blue : Colors.black),
                  onPressed: () => context.read<BottomNavigationCubit>().changeTab(0),
                ),
                IconButton(
                  icon: Icon(Icons.person, color: selectedIndex == 1 ? Colors.blue : Colors.black),
                  onPressed: () => context.read<BottomNavigationCubit>().changeTab(1),
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: selectedIndex == 2 ? Colors.blue : Colors.black),
                  onPressed: () => context.read<BottomNavigationCubit>().changeTab(2),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
