import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db/controller/home_controller.dart';
import 'package:local_db/models/user_model.dart';
import 'package:local_db/pages/home_view.dart';

import '../controller/add_data_controller.dart';

class EditDataView extends StatelessWidget {
  EditDataView({super.key});

  final controller = Get.put(HomeController());
  final controllerAddData = Get.put(AddDataController());


  @override
  Widget build(BuildContext context) {
    final UserModel user = Get.arguments;
    final int id = user.id!;
    controllerAddData.nama.text = user.nama!;
    controllerAddData.email.text = user.email!;
    return Scaffold(
      appBar: AppBar(title: Text("Edit Data"),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controllerAddData.nama,
              decoration: InputDecoration(
                  labelText: "Nama"
              ),
            ),

            TextField(
              controller: controllerAddData.email,
              decoration: InputDecoration(
                  labelText: "Email"
              ),
            ),

            SizedBox(height: 16,),

            ElevatedButton(
              onPressed: () {
                controller.editDataUser(id, controllerAddData.nama.text, controllerAddData.email.text);
                Get.snackbar("Sukses", "Data berhasil diubah");
                Get.offAll(HomeView());
              },
              child: Text("Simpan"),
            )
          ],
        ),
      )
    );
  }
}
