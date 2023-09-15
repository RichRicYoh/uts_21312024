import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<DocumentSnapshot<Object?>> GetData(String id) async {
    DocumentReference docRef =
        firestore.collection("mahasiswa_21312024").doc(id);
    return docRef.get();
  }

  void updateProduct(String npm, String nama, String alamat, String id) async {
    DocumentReference productById =
        firestore.collection("mahasiswa_21312024").doc(id);
    try {
      await productById.update({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil mengubah data product",
          onConfirm: () {
            cNpm.clear();
            cNama.clear();
            cAlamat.clear();
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
    cNpm = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    cNpm.dispose();
    cNama.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}
