import 'package:firebase_auth_bug_reproduction/firebase_options.dart';
import 'package:firebase_auth_bug_reproduction/verification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthenticationScreen(),
    );
  }
}

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final phone = TextEditingController();
  final code = TextEditingController();
  final pages = PageController();
  String? verificationId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter phone number'),
      ),
      body: PageView(
        controller: pages,
        children: [
          Column(
            children: [
              const Text(
                'Enter phone number. Example: +7 777 777 77 77',
              ),
              TextField(
                controller: phone,
              ),
              MaterialButton(
                child: const Text('Send code'),
                onPressed: () {
                  sendCode(phone.text)
                      .then(
                        (value) => pages.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        ),
                      )
                      .onError(
                        (error, stackTrace) => Logger().e(error),
                      );
                },
              )
            ],
          ),
          Column(
            children: [
              const Text(
                'Enter code',
              ),
              TextField(
                controller: code,
              ),
              MaterialButton(
                child: const Text('Verify code'),
                onPressed: () {
                  verifyCode(code.text, verificationId: verificationId!)
                      .then(
                        (uid) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthenticatedScreen(uid: uid),
                          ),
                        ),
                      )
                      .onError(
                        (error, stackTrace) => Logger().e(error),
                      );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AuthenticatedScreen extends StatelessWidget {
  const AuthenticatedScreen({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(uid),
      ),
    );
  }
}
