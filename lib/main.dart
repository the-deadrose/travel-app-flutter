import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_flutter/config/injector/injector_config.dart';
import 'package:travel_app_flutter/features/home/presentation/bloc/home_bloc.dart';
import 'package:travel_app_flutter/features/welcome/presentation/bloc/welcome_bloc.dart';
import 'package:travel_app_flutter/features/welcome/presentation/page/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDepedencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeBloc>(
          create: (_) => getIt<WelcomeBloc>(),
        ),
        BlocProvider(create: (_) => getIt<HomeBloc>()),
      ],
      child: const MaterialApp(
          title: 'Flutter Travel App',
          debugShowCheckedModeBanner: false,
          home: WelcomePage()),
    );
  }
}
