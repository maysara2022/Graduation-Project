import 'package:cloud_firestore/cloud_firestore.dart';

class TestMays {
  late String? title;
  late String? description;
  late String? type;
  late String? address;
  late String? imageUrl;
  late String? userId;
  late String? status;
  late Timestamp? time;

  TestMays({
    required this.title,
    required this.description,
    required this.type,
    required this.address,
    required this.imageUrl,
    required this.userId,
    required this.status,
    required this.time,
  });

  TestMays.fromMap(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    type = json['type'];
    address = json['address'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    status = json['status'];
    time = json['time'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['userId'] = userId;
    data['status'] = status;
    data['time'] = time;
    return data;
  }
}
