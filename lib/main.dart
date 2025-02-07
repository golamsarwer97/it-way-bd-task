import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as nav;

import './features/task_list/presentation/screens/task_list.dart';
import './core/utils/dependency.dart';
import './core/theme/app_theme.dart';
import 'features/task_add/presentation/screens/task_add.dart';
import 'features/task_details/presentation/screens/task_details.dart';

void main() async {
  await Dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Dependency.providers,
      child: nav.GetMaterialApp(
        title: 'TODO App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const TaskListPage(),
        routes: {
          TaskListPage.routeName: (context) => TaskListPage(),
          TaskAddPage.routeName: (context) => TaskAddPage(),
          TaskDetailsPage.routeName: (context) => TaskDetailsPage(),
        },
      ),
    );
  }
}
