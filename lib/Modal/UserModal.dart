

/*class ContactModal {
  String name;
  String phone;
  String chatConversation;
  String date;
  String time;
  String image;

  ContactModal({
    required this.name,
    required this.phone,
    required this.chatConversation,
    required this.date,
    required this.time,
    required this.image,
  });
}*/

class Contact {
  final String name;
  final String phone;
  final String chatConversation;
  final String date;
  final String time;
  final String imageUrl;

  Contact({
    required this.name,
    required this.phone,
    required this.chatConversation,
    required this.date,
    required this.time,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'chatConversation': chatConversation,
      'date': date,
      'time': time,
      'imageUrl': imageUrl,
    };
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      phone: json['phone'],
      chatConversation: json['chatConversation'],
      date: json['date'],
      time: json['time'],
      imageUrl: json['imageUrl'],
    );
  }
}

