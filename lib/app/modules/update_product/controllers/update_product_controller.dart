import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cProgram;
  late TextEditingController cJk;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<DocumentSnapshot<Object?>> GetData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);
    return docRef.get();
  }

  void updateProduct(String npm, String nama, String alamat, String program,
      String jk, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa").doc(id);
    try {
      await productById.update({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
        "program_studi": program,
        "jk": jk
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil mengubah data product",
          onConfirm: () {
            cNpm.clear();
            cNama.clear();
            cAlamat.clear();
            cProgram.clear();
            cJk.clear();
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
    cProgram = TextEditingController();
    cJk = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    cNpm.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cProgram.dispose();
    cJk.dispose();
    super.onClose();
  }
}
