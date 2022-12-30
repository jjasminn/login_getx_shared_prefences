import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../User/user.dart';

class Controller extends GetxController {
  var Users = <User>[
    User("xlola", "123", "sdasd@.com"),
    User("leyla", "123", "sdasd@.com"),
    User("omer", "123", "sdasd@.com"),
    User("aras", "123", "sdasd@.com"),
    User("baran", "123", "sdasd@.com"),
  ].obs;

  bool addUser(User user) {
    for (User u in Users) {
      if (u.username == user.username) {
        return false;
      }
    }

    Users.add(user);
    print("added");
    return true;
  }

  bool isExist(String usern, String pass) {
    for (User u in Users) {
      if (u.username == usern && u.password == pass) {
        return true;
      }
    }
    return false;
  }

  void deleteUser(User user) {
    Users.remove(user);
  }
}
