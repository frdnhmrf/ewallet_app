import 'package:ewallet/shared/shared_theme.dart';
import 'package:ewallet/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            backgroundColor: lightBackgrounColor,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: blackColor),
              backgroundColor: lightBackgrounColor,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            )),
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
