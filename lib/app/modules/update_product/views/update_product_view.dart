import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_product_controller.dart';

class UpdateProductView extends GetView<UpdateProductController> {
  const UpdateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.GetData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNpm.text = data['npm'].toString();
            controller.cNama.text = data['nama'];
            controller.cAlamat.text = data['alamat'];
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(children: [
                TextField(
                  controller: controller.cNpm,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: "Npm"),
                ),
                SizedBox(),
                TextField(
                  controller: controller.cNama,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Nama"),
                ),
                TextField(
                  controller: controller.cAlamat,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: "Alamat"),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () => controller.updateProduct(
                        controller.cNpm.text,
                        controller.cNama.text,
                        controller.cAlamat.text,
                        Get.arguments),
                    child: Text("ubah")),
              ]),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
