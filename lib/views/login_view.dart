import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/views/note_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Đăng nhập"), backgroundColor: Colors.amber,
          actions: [
            PopupMenuButton<MenuAction>(onSelected: (value) {
              
            },itemBuilder: (context) {
              return const [
                  PopupMenuItem<MenuAction>(
                      child: const Text("Logout"),
                      value: MenuAction.logout,
                    )
              ];
            },)
          ],),
      body: Column(
        children: [
          
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: "Vui lòng nhập Email"),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration:
                const InputDecoration(hintText: "Vui lòng nhập Password"),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                final userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password);
                print(userCredential);
              } on FirebaseAuthException catch (ex) {
                print("some error");
                print(ex.code);
              }
            },
            child: const Text("Đăng nhập"),
          ),
           TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/register/', (route) => false);
              },
              child: Text("Bạn chưa có tài khoản? Đăng ký ngay.")),
        ],
      ),
    );
  }
}

enum MenuAction {
  logout
}
