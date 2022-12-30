import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:login_getx_shared_prefences/User/user.dart';
import 'package:login_getx_shared_prefences/widgets/users_list_tile.dart';

import '../controller/controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Controller controller = Get.find();
  Widget build(BuildContext context) {
    List<User> users = controller.Users;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Users"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Obx(() => ListView(
              physics: BouncingScrollPhysics(),
              children:
                  users.map((element) => UsersListTile(user: element)).toList(),
            )),
      ),
    );
  }
}
