import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../User/user.dart';
import '../controller/controller.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  Controller controller = Get.find();
  @override
  List<String> old = ["Kullanici adi   ", "Sifre   ", "Email  "];
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isAdded = true;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          isAdded
              ? SizedBox(
                  height: 20,
                )
              : Text("Bu username daha once kullanilmis"),
          buildCard(0, usernameController),
          buildCard(1, passController),
          buildCard(2, emailController),
          ElevatedButton(
              onPressed: () {
                isAdded = controller.addUser(User(usernameController.text,
                    passController.text, emailController.text));
                setState(() {});
              },
              child: Text("Kayit")),
        ],
      ),
    );
  }

  Card buildCard(int index, TextEditingController controller) {
    return Card(
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(children: [
          Text(
            old[index],
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextField(
            controller: controller,
          )
        ]),
      ),
    );
  }
}
