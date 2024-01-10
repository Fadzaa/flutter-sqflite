import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db/models/user_model.dart';
import 'package:local_db/pages/home_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AddDataController extends GetxController {

    TextEditingController nama = TextEditingController();
    TextEditingController email = TextEditingController();

    void addDataUser() async {
      String table = "user";
      Directory directory = await getApplicationDocumentsDirectory();
      String path = directory.path + "db_user";
      Database? database;

      database = await openDatabase(path);

      UserModel user = UserModel(
        nama: nama.text,
        email: email.text
      );

      await database!.insert(table, user.toJson());
      Get.offAll(HomeView());
    }

    @override
    void onClose() {
      nama.dispose();
      email.dispose();
      super.onClose();
    }
}