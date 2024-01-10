import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_db/controller/add_data_controller.dart';
import 'package:local_db/models/user_model.dart';
import 'package:local_db/pages/add_data_view.dart';
import 'package:local_db/pages/edit_data_view.dart';

import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});

  final controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Database"),),

      body: FutureBuilder<List<UserModel>> (
        future: controller.getDataUser(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                UserModel user = snapshot.data![index];
                return ListTile(
                  title: Text(user.nama!),
                  subtitle: Text(user.email!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(EditDataView(), arguments: user);
                },
                        icon: Icon(Icons.edit),
                      ),

                      IconButton(
                        onPressed: () {
                          controller.deleteDataUser(snapshot.data![index].id!);

                          Get.snackbar("Sukses", "Data berhasil dihapus");
                          Get.offAll(HomeView());
                        },
                        icon: Icon(Icons.delete),
                      ),

                    ],
                  )
                );
              },
            );

          } else {
            return  Center(child: Text("Tidak ada data"),);
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddDataView());
        },
        child: Icon(Icons.add),
      )
    );

  }
}
