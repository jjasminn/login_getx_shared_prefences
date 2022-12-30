import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:login_getx_shared_prefences/pages/in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/controller.dart';

class OldUser extends StatefulWidget {
  const OldUser({super.key});

  @override
  State<OldUser> createState() => _OldUserState();
}

class _OldUserState extends State<OldUser> {
  Controller controller = Get.put(Controller());
  @override
  void initState() {
    super.initState();
    getDefaultValue();
  }

  List<String> old = ["Kullanici adi   ", "Sifre   "];
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool exist = true;

  String _currentusername = "";
  String _currentpass = "";
  Future<void> getDefaultValue() async {
    final prefs = await SharedPreferences.getInstance();

    final String? usrname = prefs.getString('username');
    final String? pass = prefs.getString("password");

    if (usrname != null && pass != null) {
      usernameController.text = usrname;
      passController.text = pass;
    }
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          buildCard(0, usernameController),
          buildCard(1, passController),
          ElevatedButton(
              onPressed: () async {
                exist = controller.isExist(
                    usernameController.text, passController.text);
                if (exist) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('username', usernameController.text);
                  await prefs.setString('password', passController.text);
                  Get.to(UserPage());
                }
              },
              child: Text("Giris")),
        ]),
      ),
    );
  }

  Card buildCard(int index, TextEditingController controller) {
    return Card(
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
