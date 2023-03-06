// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learningdart/home_screen.dart';
import 'package:learningdart/views/login_view.dart';
import 'package:learningdart/views/note_view.dart';
import 'package:learningdart/views/register_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'firebase_options.dart';
import 'package:learningdart/input_form.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
      routes: {
        "/login/": (context) => LoginView(),
        "/register/": (context) => RegisterView(),
        "/note/": (context) => NoteView(),
        "/home-screen/": (context) => LandingPage(),
        "/input_form/": (context) => HomeScreen(),
      },
      locale: Locale("en"),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return LoginView();
          //final user = FirebaseAuth.instance.currentUser;
          //print(user);
          //print(user?.emailVerified);
          //if (user != null) {
          // if (user.emailVerified) {
          //   return LoginView();
          // } else {
          //   return LoginView();
          // }
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //         '/note/',
          //         (_) => false,
          // );
          // / print(user.emailVerified);

          //}
          // return Text("Done");
          default:
            return Text("Loading");
        }
      },
    );
  }
}
