import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garagewa/core/cubits/app_user/app_user_cubit.dart';
import 'package:garagewa/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:garagewa/feature/auth/presentation/pages/login.dart';
import 'package:garagewa/feature/home/presentation/bloc/home_bloc.dart';
import 'package:garagewa/feature/home/presentation/widgets/bottom_navbar.dart';
import 'package:garagewa/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => servicLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => servicLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => servicLocator<HomeBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLogedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggdIn;
        },
        builder: (context, isLoggedin) {
          if (isLoggedin) {
            return const BottomNavBar();
          }
          return const Login();
        },
      ),
    );
  }
}
