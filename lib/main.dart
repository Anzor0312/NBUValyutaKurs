import 'package:amaliyot/cubit/home_state.dart';
import 'package:amaliyot/repository/home_repository.dart';
import 'package:amaliyot/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HomeRepository.registerAdapters();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => HomeCubit(),)
  ], child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

        home: HomePage()
        );
  }
}
