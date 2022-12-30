import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_getx_shared_prefences/pages/new_user.dart';
import 'package:login_getx_shared_prefences/pages/old_user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  int currentpage = 1;
  Widget currentscreen = OldUser();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Uygulama Ismi ",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 30,
            ),
            currentscreen
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [Icons.add, FontAwesomeIcons.arrowRight],
        activeIndex: currentpage,
        onTap: (index) {
          setState(() {
            currentpage = index;
            currentscreen = (index == 0) ? NewUser() : OldUser();
          });
        },
        backgroundColor: Colors.indigo,
        splashColor: Colors.grey,
        inactiveColor: Colors.white,
        activeColor: Colors.black,
      ),
    );
  }
}
