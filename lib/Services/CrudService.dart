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
