class Comlpaint {
  String id;
  String title;
  String description;
  String type;
  String address;
  String imageUrl;
  String userId;
  String status;
  DateTime? time;


  Comlpaint({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.address,
    required this.imageUrl,
    required this.userId,
    required this.status,
    required this.time,
  });

  factory Comlpaint.fromMap(String id, Map<String, dynamic> data) {
    return Comlpaint(
      id: id,
      title: data['title'],
      description: data['description'],
      type: data['type'],
      address: data['address'],
      imageUrl: data['imageUrl'],
      userId: data['userId'],
      status: data['status'],
      time: data['time'] != null ? DateTime.parse(data['time']) : null,
    );
  }
}



