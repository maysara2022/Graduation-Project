import 'package:cloud_firestore/cloud_firestore.dart';

class ModelAds {
  late String? title;
  late String? content;
  late Timestamp? time;

  ModelAds(
      {required this.title,
        required this.content,
        required this.time,
      });

  ModelAds.fromMap(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    time = json['time'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    data['time'] = time;
    return data;
  }
}
