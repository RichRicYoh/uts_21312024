import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cHarga;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<DocumentSnapshot<Object?>> GetData(String id) async {
    DocumentReference docRef = firestore.collection("production").doc(id);
    return docRef.get();
  }

  void updateProduct(String nama, String harga, String id) async {
    DocumentReference productById = firestore.collection("production").doc(id);
    try {
      await productById.update({
        "name": nama,
        "price": harga,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil mengubah data product",
          onConfirm: () {
            cNama.clear();
            cHarga.clear();
            Get.back();
            Get.back();
          },
          textConfirm: "OK");
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal menambahkan produk",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cHarga = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    cNama.dispose();
    cHarga.dispose();
    super.onClose();
  }
}
