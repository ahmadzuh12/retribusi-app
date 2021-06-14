import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc/signin_bloc/signin_bloc.dart';
import 'helpers/routes.dart';
import 'repositories/auth_repo.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/auth_bloc/auth_event.dart';
import 'constants/base_string.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider<AuthBloc>(
    create: (_) => AuthBloc(AuthRepository())..add(AppStarted()),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(
          create: (_) =>
              SignInBloc(AuthRepository(), AuthBloc(AuthRepository())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: BaseString.appName,
        theme: ThemeData(
          primaryColor: Color(0xff27AE60),
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
