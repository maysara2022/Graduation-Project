import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:graduationproject/firebase/fb_auth_controller.dart';
import 'package:graduationproject/models/Complaint.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ComlaintController extends GetxController {

  CollectionReference comlaint =
  FirebaseFirestore.instance.collection('complaints');
  RxList<Comlpaint> complaints = <Comlpaint>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxString selectedType = ''.obs;
  final FbAuthController _authController = Get.find();


  //final FirebaseStorage _storage = FirebaseStorage.instance;




  @override
  void onInit() {
    super.onInit();
    complaints.bindStream(getComlaint());
  }


  Future<void> fetchComplaints(String selectedType) async {
    try {
      Query<Map<String, dynamic>> query = FirebaseFirestore.instance.collection('complaints');

      if (selectedType.isNotEmpty) {
        query = query.where('type', isEqualTo: selectedType);
      }

      final QuerySnapshot<Map<String, dynamic>> snapshot = await query.orderBy('date').get();

      final List<Comlpaint> fetchedComplaints = snapshot.docs
          .map((doc) => Comlpaint.fromMap(doc.id, doc.data()))
          .toList();

      complaints.value = fetchedComplaints;
    } catch (e) {
      Get.snackbar('Error', 'Error : ${e.toString()}');
    }
  }



  Stream<List<Comlpaint>> get comlaintStream {
   // String uid = _authController.firebaseUser.value!.uid;
    return _firestore.collection('complaints').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Comlpaint(
          id: doc.id,
          title: data['title'],
          description: data['description'],
          type: data['type'],
          address: doc['address'],
          imageUrl: data['imageUrl'],
          userId:data['userId'],
          status: data['status'],
          time: data['time'],
        );
      }).toList();
    });
  }
  // Stream<List<Comlpaint>> getComplaintData() {
  //   String myId = _authController.firebaseUser.value!.uid;
  //   print(myId);
  //   return FirebaseFirestore.instance
  //       .collection('complaints')
  //       .where('userId', isEqualTo: myId)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs.map((doc) {
  //     final data = doc.data();
  //     return Comlpaint(
  //       id: doc.id,
  //       title: data['title'],
  //       description: data['description'],
  //       type: data['type'],
  //       address: data['address'],
  //       imageUrl: data['imageUrl'],
  //       userId: data['userId'],
  //       status: data['status'],
  //       time: (data['time'] as Timestamp).toDate(),
  //     );
  //   }).toList());
  // }



  Stream<List<Comlpaint>> getComlaint() {
    return comlaint.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Comlpaint(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          type: doc['type'],
          address: doc['address'],
          imageUrl: doc['imageUrl'],
          userId:doc['userId'],
          status:doc['status'],
          time: (doc['time'] as Timestamp).toDate(), // Convert Timestamp to DateTime
        );
      }).toList();
    });
  }


  Future<void> addComlaint(
      String title, String description,String address ,String type, XFile imageFile) async {
    String myId = FirebaseAuth.instance.currentUser!.uid;

    String imageName = DateTime.now().toString() + '.png';
    Reference ref = FirebaseStorage.instance.ref().child(imageName);
    UploadTask uploadTask = ref.putFile(File(imageFile.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    await comlaint.add({
      'userId': myId,
      'title': title,
      'description': description,
      'type': type,
      'address': address,
      'imageUrl': imageUrl,
      'status' : 'to do',
      'time': DateTime.now(),
    });
  }

  Future<void> deleteComlaint(String id) async {
    await comlaint.doc(id).delete();
  }

  Future<void> updateComlaint(String id, String status) async {
  //  String? imageUrl;
  //  if (imageFile != null) {
  //    String imageName = DateTime.now().toString() + '.png';
  //    Reference ref = FirebaseStorage.instance.ref().child(imageName);
  //    UploadTask uploadTask = ref.putFile(File(imageFile.path));
  //    TaskSnapshot taskSnapshot = await uploadTask;
  //    imageUrl = await taskSnapshot.ref.getDownloadURL();
  //  }
    await comlaint.doc(id).update({
      'status': status,
    });
  }

}
