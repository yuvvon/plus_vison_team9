import 'package:firebase_core/firebase_core.dart';
import 'package:team9/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:team9/components/my_textfild.dart';
import 'package:team9/pages/home_page.dart';
import 'package:team9/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  //
  var userID = TextEditingController();
  var password = TextEditingController();

  void dispose() {
    userID.dispose();
    password.dispose();
    super.dispose();
  }

  //sign user in method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Center(
              child: Column(children: [
            SizedBox(height: 50),
            //logo
            Icon(
              Icons.lock,
              size: 100,
            ),
            SizedBox(height: 50),

            Text('Wellcome!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16)),

            SizedBox(height: 50),

            //user_id
            MyTextField(
              controller: userID,
              hintText: 'ID',
              obscureText: false,
            ),

            SizedBox(height: 10),
            //user_password

            MyTextField(
                controller: password, hintText: 'password', obscureText: true),

            SizedBox(
              height: 10,
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                )),
            const SizedBox(
              height: 25,
            ),

            InkWell(
                onTap: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: userID.text,
                            password: password.text) //아이디와 비밀번호로 로그인 시도
                        .then((value) {
                      print(value);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MainPage()));
                      return value;
                    });
                  } on FirebaseAuthException catch (e) {
                    //로그인 예외처리
                    if (e.code == 'user-not-found') {
                      print('등록되지 않은 이메일입니다');
                    } else if (e.code == 'wrong-password') {
                      print('비밀번호가 틀렸습니다');
                    } else {
                      print(e.code);
                    }
                  }
                },
                child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text("Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                    ))),

            const SizedBox(
              height: 25,
            ),

            InkWell(
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text("Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                    ))),

            const SizedBox(
              height: 50,
            ),

            Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            )
          ])),
        ));
  }
}
