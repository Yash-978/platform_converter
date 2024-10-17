import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUDService {
  User? user = FirebaseAuth.instance.currentUser;

// add new contacts to firestore
  Future addNewContacts(
      String name,
      String phone,
      // String email,
      String image,
      String chatConversation,
      String pickDate,
      String pickTime,
      ) async {
    Map<String, dynamic> data = {
      "name": name,
      // "email": email,
      "phone": phone,
      "chatConversation": chatConversation,
      "pickDate": "pickDate",
      "pickTime": "pickTime",
      "image": "image",
    };
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .add(data);
      print("Document Added");
    } catch (e) {
      print(e.toString());
    }
  }

  // read documents inside firestore
  Stream<QuerySnapshot> getContacts() async* {
    var contacts = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("contacts")
        .orderBy("name")
        .snapshots();
    yield* contacts;
  }

  // Stream<QuerySnapshot> getContacts({String? searchQuery}) async* {
  //   var contactsQuery = FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .collection("contacts")
  //       .orderBy("name");
  //
  //   // a filter to perfom search
  //   if (searchQuery != null && searchQuery.isNotEmpty) {
  //     String searchEnd = searchQuery + "\uf8ff";
  //     contactsQuery = contactsQuery.where("name",
  //         isGreaterThanOrEqualTo: searchQuery, isLessThan: searchEnd);
  //   }
  //
  //   var contacts = contactsQuery.snapshots();
  //   yield* contacts;
  // }

  // update a contact
  Future updateContact(
      String name, String phone, String chatConversation, String docID) async {
    Map<String, dynamic> data = {"name": name, "chatConversation": chatConversation, "phone": phone};
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .update(data);
      print("Document Updated");
    } catch (e) {
      print(e.toString());
    }
  }

  // delete contact from firestore
  Future deleteContact(String docID) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .delete();
      print("Contact Deleted");
    } catch (e) {
      print(e.toString());
    }
  }
}


/*class CRUDService {
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Uploads an image to Firebase Storage and returns the download URL
  Future<String?> uploadImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return null;
      }
      final reference = _storage.ref().child("images/${image.name}");
      await reference.putFile(File(image.path));
      String downloadURL = await reference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print("Failed to upload image: $e");
      return null;
    }
  }

// add new contacts to firestore
  Future<void> addNewContacts(
    String name,
    String phone,
    String chatConversation,
    String pickDate,
    String pickTime,
    String time,
  ) async {
    String? imageUrl = await uploadImage();
    if (imageUrl == null) {
      print("No image selected or upload failed.");
      return;
    }

    Map<String, dynamic> data = {
      "name": name,
      "phone": phone,
      "chatConversation": chatConversation,
      "pickDate": pickDate,
      "pickTime": pickTime,
      "image": imageUrl,
    };

    try {
      await _firestore
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .add(data);
      print("Document Added");
    } catch (e) {
      print("Failed to add contact: $e");
    }
  }

  // Future addNewContacts(
  //   String name,
  //   String phone,
  //   // String email,
  //   String image,
  //   String chatConversation,
  //   String pickDate,
  //   String pickTime,
  // ) async {
  //   Map<String, dynamic> data = {
  //     "name": name,
  //     // "email": email,
  //     "phone": phone,
  //     "chatConversation": chatConversation,
  //     "pickDate": "pickDate",
  //     "pickTime": "pickTime",
  //     "image": "image",
  //   };
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(user!.uid)
  //         .collection("contacts")
  //         .add(data);
  //     print("Document Added");
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // read documents inside firestore
  // Stream<QuerySnapshot> getContacts() async* {
  //   var contacts = FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .collection("contacts")
  //       .orderBy("name")
  //       .snapshots();
  //   yield* contacts;
  // }
  Stream<QuerySnapshot> getContacts() async* {
    print("Fetching contacts for user: ${user!.uid}");
    var contacts = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("contacts")
        .orderBy("name")
        .snapshots();
    yield* contacts;
  }

  Future updateContact(
      String name, String phone, String chatConversation, String docID) async {
    Map<String, dynamic> data = {
      "name": name,
      "chatConversation": chatConversation,
      "phone": phone
    };
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .update(data);
      print("Document Updated");
    } catch (e) {
      print(e.toString());
    }
  }

  // delete contact from firestore
  Future deleteContact(String docID) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .delete();
      print("Contact Deleted");
    } catch (e) {
      print(e.toString());
    }
  }
}*/

/*
class CRUDService {
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Uploads an image to Firebase Storage and returns the download URL
  Future<String?> uploadImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return null;
      }
      final reference = _storage.ref().child("images/${image.name}");
      await reference.putFile(File(image.path));
      String downloadURL = await reference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print("Failed to upload image: $e");
      return null;
    }
  }

  // Adds new contacts to Firestore with an uploaded image URL
  Future<void> addNewContacts(
    String name,
    String phone,
    String chatConversation,
    String pickDate,
    String pickTime,
    String time,
  ) async {
    String? imageUrl = await uploadImage();
    if (imageUrl == null) {
      print("No image selected or upload failed.");
      return;
    }

    Map<String, dynamic> data = {
      "name": name,
      "phone": phone,
      "chatConversation": chatConversation,
      "pickDate": pickDate,
      "pickTime": pickTime,
      "image": imageUrl,
    };

    try {
      await _firestore
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .add(data);
      print("Document Added");
    } catch (e) {
      print("Failed to add contact: $e");
    }
  }

  // Reads documents from Firestore
  Stream<QuerySnapshot> getContacts() {
    return _firestore
        .collection("users")
        .doc(user!.uid)
        .collection("contacts")
        .orderBy("name")
        .snapshots();
  }

  // Updates a contact
  Future<void> updateContact(
    String name,
    String phone,
    String chatConversation,
    String docID,
  ) async {
    Map<String, dynamic> data = {
      "name": name,
      "phone": phone,
      "chatConversation": chatConversation,
    };
    try {
      await _firestore
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .update(data);
      print("Document Updated");
    } catch (e) {
      print("Failed to update contact: $e");
    }
  }

  // Deletes a contact from Firestore
  Future<void> deleteContact(String docID) async {
    try {
      await _firestore
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .delete();
      print("Contact Deleted");
    } catch (e) {
      print("Failed to delete contact: $e");
    }
  }
}*/
