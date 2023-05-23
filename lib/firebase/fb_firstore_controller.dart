import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationproject/models/expense.dart';
import 'package:graduationproject/models/modelAds.dart';
import 'package:graduationproject/models/usersData.dart';
import 'package:graduationproject/utils/FirbaseHelper.dart';

class FbFirstoreController with FirbaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Expense>> read() async* {
    yield* _firestore
        .collection('news')
        .withConverter<Expense>(
            fromFirestore: (snapshot, options) =>
                Expense.fromMap(snapshot.data()!),
            toFirestore: (value, options) => value.toMap())
        .snapshots();
  }

  Stream<QuerySnapshot<ModelAds>> adsRead() async* {
    yield* _firestore
        .collection('Ads')
        .withConverter<ModelAds>(
            fromFirestore: (snapshot, options) =>
                ModelAds.fromMap(snapshot.data()!),
            toFirestore: (value, options) => value.toMap())
        .snapshots();
  }

  Stream<QuerySnapshot<userData>> userDataRead() async* {
    yield* _firestore
        .collection('user2').where('subscriptionNumber',isEqualTo: 407000010)
        .withConverter<userData>(

            fromFirestore: (snapshot, options) =>
                userData.fromMap(snapshot.data()!),
            toFirestore: (value, options) => value.toMap())
        .snapshots();
    print(true);

  }


  createUserInFirestore(String name, String phone, String idNumber,
      String email, String subId, String userId) async {
    _firestore.collection("users").doc(userId).set({
      "name": name,
      "phone": phone,
      "idNumber": idNumber,
      "email": email,
      "subId": subId,
      "userId": userId
    });
  }
}
