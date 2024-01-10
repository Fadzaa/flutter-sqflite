import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_data_controller.dart';

class AddDataView extends StatelessWidget {
  AddDataView({super.key});
  final controller = Get.put(AddDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Data"),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.nama,
              decoration: InputDecoration(
                labelText: "Nama"
              ),
            ),

            TextField(
              controller: controller.email,
              decoration: InputDecoration(
                  labelText: "Email"
              ),
            ),

            SizedBox(height: 16,),

            ElevatedButton(
              onPressed: () {
                controller.addDataUser();
              },
              child: Text("Simpan"),
            )
          ],
        ),
      )
    );
  }
}
