import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  late String? title;
  late String? content;
  late String? imageUrl;
  late Timestamp? time;

  Expense(
      {required this.title,
      required this.content,
      required this.imageUrl,
      required this.time,
      });

  Expense.fromMap(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    imageUrl = json['imageUrl'];
    time = json['time'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    data['imageUrl'] = imageUrl;
    data['time'] = time;
    return data;
  }
}
