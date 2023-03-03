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
      appBar: AppBar(
        title: const Text("Đăng nhập"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: "Vui lòng nhập email"),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration:
                const InputDecoration(hintText: "Vui lòng nhập mật khẩu"),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              if (email.isEmpty || password.isEmpty) {
                showLogOutDialog(
                    context, "Vui lòng nhập đầy đủ email và password");
                return;
              }

              try {
                final userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password);
                print(userCredential);

                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home-screen/',
                  (route) => false,
                );
              } on FirebaseAuthException catch (ex) {
                switch (ex.code) {
                  case "invalid-email":
                    showLogOutDialog(
                        context, "Email không hợp lệ. Vui lòng kiểm tra lại.");
                    break;
                  case "wrong-password":
                    showLogOutDialog(
                        context, "Sai mật khẩu. Vui lòng kiểm tra lại.");
                    break;
                  case "user-not-found":
                    showLogOutDialog(
                        context, "Email không tồn tại. Vui lòng kiểm tra lại.");
                    break;
                  default:
                    break;
                }
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

Future<bool> showLogOutDialog(BuildContext context, String message) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Thông báo"),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Đồng ý")),
          ],
        );
      }).then((value) => value ?? false);
}
