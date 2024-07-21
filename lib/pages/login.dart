import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/register.dart';
import 'package:flutter_application_1/pages/showtrip.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorText = '';
  int count = 0;
  String phoneNo = '';
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'หมายเลขโทรศัพท์',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: phoneCtl,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'รหัสผ่าน',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    controller: passwordCtl,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: register,
                            child: const Text('ลงทะเบียนใหม่')),
                        FilledButton(
                            onPressed: login, child: const Text('เข้าสู่ระบบ')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Text(errorText,style: const TextStyle(color: Colors.red))
            Text(errorText)
          ],
        ),
      ),
    );
  }

  void register() {
    log('This is Register button');
    // setState(() {
    //   text = 'Hello word!!!';
    // });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        ));
  }

  void login() {
    // setState(() {
    //   count++;
    //   text = 'Login time:$count';
    //   log('Login time:$count');
    // });
    if (phoneCtl.text == '0812345678' && passwordCtl.text == '1234') {
      log(phoneCtl.text);
      log(phoneCtl.text);
       setState(() {
        errorText = '';
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ShowTrip(),
          ));
    } else {
      setState(() {
        errorText = 'หมายเลขโทรศัพท์หรือรหัสผ่านไม่ถูกต้อง';
      });
    }
  }
}
