import 'package:graduationproject/models/firebase_response.dart';

mixin FirbaseHelper{
  FirebaseResponse getRespose({bool error = false}) => FirebaseResponse(error ? 'noooo':'yesss',!error,'');
}