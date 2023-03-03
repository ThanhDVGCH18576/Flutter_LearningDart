import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          AppBar(title: const Text("Đăng ký"), backgroundColor: Colors.amber),
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
              try {
                final userCredential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email, password: password);
                // ignore: use_build_context_synchronously
                showMessageDialog(context,"Đăng ký thành công");
                print(userCredential);
              } on FirebaseAuthException catch (e) {
                switch (e.code) {
                  case "weak-password":
                    showMessageDialog(context,"Mật khẩu yếu.");
                    break;
                  case "email-already-in-use":
                    showMessageDialog(context,"Email đã được sử dụng.");
                    break;
                  case "invaild-email":
                    showMessageDialog(context,"Email không tồn tại.");
                    break;
                  default:
                    break;
                }
              }
            },
            child: const Text("Đăng ký"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login/', (route) => false);
              },
              child: Text("Bạn đã có tài khoản? Đăng nhập ngay.")),
        ],
      ),
    );
  }
}

Future<bool> showMessageDialog(BuildContext context,String message) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Thông báo"),
          content:  Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Hủy bỏ")),
          ],
        );
      }).then((value) => value ?? false);
}