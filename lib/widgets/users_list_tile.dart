import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../User/user.dart';
import '../controller/controller.dart';

class UsersListTile extends StatelessWidget {
  const UsersListTile({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
        child: ListTile(
          title: Row(children: [
            Text(
              user.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20,
            ),
            Text(user.email),
          ]),
          trailing: _buildIcons(
            user,
          ),
        ),
      ),
    );
  }
}

Row _buildIcons(User user) {
  Controller _controller = Get.find();
  return Row(mainAxisSize: MainAxisSize.min, children: [
    IconButton(
      onPressed: null,
      icon: Icon(Icons.edit),
      color: Colors.grey,
    ),
    IconButton(
      onPressed: () => _controller.deleteUser(user),
      icon: Icon(Icons.delete),
      color: Colors.red,
    )
  ]);
}
