import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/firebase_response.dart';

class FbAuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);

  Future<FirebaseResponse> sigIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return FirebaseResponse("تم تسجيل الدخول بنجاح", true,'');
    } on FirebaseAuthException catch (e) {
      return FirebaseResponse('كلمة المرور أو البريد الالكتروني غير صحيح , يرجى المحاولة', false,'');
    } catch (e) {
      return  FirebaseResponse('هنالك خطأ ما يرجى المحاولة', false,'');
    }
  }

  Future<FirebaseResponse> createAccount(
      String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(name);

      ///
      await userCredential.user!.sendEmailVerification();

      /// سطر معتز لارسال الايميل للتاكد
      await _auth.signOut();

      ///
      return  FirebaseResponse(
          'تم التسجيل بنجاح', true,userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      return  FirebaseResponse('البيانات المدخلة غير صحيحة أو فارغة', false,'');
    } catch (e) {
      return  FirebaseResponse('هنالك خطأ ما يرجى المحاولة', false,'');
    }
  }

  bool get sigedIn => _auth.currentUser != null;

  Future<void> signOut() async {
    _auth.signOut();
  }

  User get user => _auth.currentUser!;
}
