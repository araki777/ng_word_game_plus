import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'page/HomePage.dart';
import 'page/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyAs0q5g8i54PO3Mi4iRg6s9TXhguifc60A",
          authDomain: "ng-word-game-plus.firebaseapp.com",
          projectId: "ng-word-game-plus",
          storageBucket: "ng-word-game-plus.firebasestorage.app",
          messagingSenderId: "479711558587",
          appId: "1:479711558587:web:fe7e76bbd4d904bf8e629e",
          measurementId: "G-YFK1EC9528",
        ),
      )
      .then((_) {
        runApp(MyApp());
      })
      .catchError((error) {
        print('Firebase初期化エラー: $error');
      });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NGWordゲーム+',
      home: AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return LoginPage();
          }
          return HomePage();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
