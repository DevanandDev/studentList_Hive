import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hiv_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLog extends StatefulWidget {
  const MyLog({super.key});

  @override
  State<MyLog> createState() => _MyLogState();
}

class _MyLogState extends State<MyLog> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _predefindUserName = 'deva';
  final _predefindPassword = '123';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 210, 234),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              Gap(10),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              Gap(20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color.fromARGB(255, 255, 210, 234),
                    shadowColor: const Color.fromARGB(255, 255, 5, 184),
                  ),
                  onPressed: () {
                  _login(context);
                  },
                  child: Text('Submit')),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    final _newUsername = _userNameController.text;
    final _newPassword = _passwordController.text;

    if (_newUsername == _predefindUserName && _newPassword == _predefindPassword) {
      final SharedPreferences pref = await SharedPreferences.getInstance();

      
    await  pref.setBool('islogged', true);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => MyHome()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('invalid username or password')));
    }
  }
}
