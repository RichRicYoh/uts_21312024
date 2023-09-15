import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddMahasiswaView'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(children: [
            TextField(
              controller: controller.cNpm,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "NPM"),
            ),
            SizedBox(),
            TextField(
              controller: controller.cNama,
              textInputAction: TextInputAction.next,
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
                onPressed: () => controller.addProduct(
                      controller.cNpm.text,
                      controller.cNama.text,
                      controller.cAlamat.text,
                    ),
                child: Text("simpan")),
          ]),
        ));
  }
}
