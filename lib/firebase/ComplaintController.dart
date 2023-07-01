import 'dart:ffi';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:graduationproject/models/complaintTest.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ComlaintController extends GetxController {
  CollectionReference comlaint =
      FirebaseFirestore.instance.collection('complaints');
  RxList<TestMays> complaints = <TestMays>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxString selectedType = ''.obs;

  Stream<QuerySnapshot<TestMays>> readdata(String userID) async* {
    yield* _firestore
        .collection('complaints')
        .where('userId', isEqualTo: userID)
        .withConverter<TestMays>(
            fromFirestore: (snapshot, options) =>
                TestMays.fromMap(snapshot.data()!),
            toFirestore: (value, options) => value.toMap())
        .snapshots();
  }




    Future<void> addComlaint(String title, String description, String address,
      String type, XFile imageFile, String userId) async {
    String imageName = DateTime.now().toString() + '.png';
    Reference ref = FirebaseStorage.instance.ref().child(imageName);
    UploadTask uploadTask = ref.putFile(File(imageFile.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    _firestore.collection("complaints").doc(userId).set({
      'title': title,
      'description': description,
      'type': type,
      'userId': userId,
      'address': address,
      'imageUrl': imageUrl,
      'status': 'قيد الدراسة',
      'time': DateTime.now(),
    });
  }
}
