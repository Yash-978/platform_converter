import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Modal/UserModal.dart';
import '../Services/CrudService.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../Services/StorageService.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LoginController extends GetxController {
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool obscure = false.obs;
  final RxBool _obscure = false.obs;
  RxBool rememberMeCheck = false.obs;
  RxBool isSignUp = false.obs;

  void obscureCheck() {
    _obscure.value = !_obscure.value;
  }
}
// contact_controller.dart

/*
class ContactController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var txtName = TextEditingController();
  var txtPhone = TextEditingController();
  var txtChatConversation = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  Rx<DateTime?> dateTime = Rx<DateTime?>(null);
  Rx<TimeOfDay?> time = Rx<TimeOfDay?>(null);

  void selectDate(BuildContext context) async {
    dateTime.value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2025),
    );
    if (dateTime.value != null) {
      dateController.text = dateTime.value!.toString().split(" ")[0];
    }
  }

  void selectTime(BuildContext context) async {
    time.value = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time.value != null) {
      timeController.text = time.value!.format(context);
    }
  }

  void saveContact() {
    if (formKey.currentState!.validate()) {
      final newContact = ContactModal(
        name: txtName.text,
        phone: txtPhone.text,
        chatConversation: txtChatConversation.text,
        date: dateController.text,
        time: timeController.text,
        image: "image", // Replace this with the actual image path or logic
      );

      CRUDService().addNewContacts(
        newContact.name,
        newContact.phone,
        newContact.image,
        newContact.chatConversation,
        newContact.date,
        newContact.time,
      );

      Get.snackbar("Success", "Contact saved successfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}*/

// class ContactController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//
//   var txtName = TextEditingController();
//   var txtPhone = TextEditingController();
//   var txtChatConversation = TextEditingController();
//   var dateController = TextEditingController();
//   var timeController = TextEditingController();
//
//   var dateString = ''.obs; // Observable for date
//   var timeString = ''.obs; // Observable for time
//
//   Rx<DateTime?> dateTime = Rx<DateTime?>(null);
//   Rx<TimeOfDay?> time = Rx<TimeOfDay?>(null);
//
//   void selectDate(BuildContext context) async {
//     dateTime.value = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1947),
//       lastDate: DateTime(2025),
//     );
//     if (dateTime.value != null) {
//       dateString.value = dateTime.value!.toString().split(" ")[0];
//       dateController.text = dateString.value;
//     }
//   }
//
//   void selectTime(BuildContext context) async {
//     time.value = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (time.value != null) {
//       timeString.value = time.value!.format(context);
//       timeController.text = timeString.value;
//     }
//   }
//
//   void saveContact() {
//     if (formKey.currentState!.validate()) {
//       final newContact = Contact(
//         name: txtName.text,
//         phone: txtPhone.text,
//         chatConversation: txtChatConversation.text,
//         date: dateString.value,
//         time: timeString.value,
//         imageUrl: "image", // Replace with actual image path or logic
//       );
//
//       CRUDService().addNewContacts(
//         newContact.name,
//         newContact.phone,
//         newContact.imageUrl,
//         newContact.chatConversation,
//         newContact.date,
//         newContact.time,
//       );
//
//       Get.snackbar("Success", "Contact saved successfully",
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }
// }

/*class ContactController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var txtName = TextEditingController();
  var txtPhone = TextEditingController();
  var txtChatConversation = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  var dateString = ''.obs;
  var timeString = ''.obs;

  Rx<DateTime?> dateTime = Rx<DateTime?>(null);
  Rx<TimeOfDay?> time = Rx<TimeOfDay?>(null);
  Rx<File?> selectedImage = Rx<File?>(null);
  var imageUrl = ''.obs;

  final ImagePicker _picker = ImagePicker();

  void selectDate(BuildContext context) async {
    dateTime.value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2025),
    );
    if (dateTime.value != null) {
      dateString.value = dateTime.value!.toString().split(" ")[0];
      dateController.text = dateString.value;
    }
  }

  void selectTime(BuildContext context) async {
    time.value = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time.value != null) {
      timeString.value = time.value!.format(context);
      timeController.text = timeString.value;
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> uploadImage() async {
    if (selectedImage.value != null) {
      try {
        // Use StorageService for image upload
        imageUrl.value =
            await StorageService.service.uploadImageFile(selectedImage.value!);
      } catch (e) {
        Get.snackbar('Error', 'Failed to upload image: $e');
      }
    }
  }

  Future<void> saveContact() async {
    if (formKey.currentState!.validate()) {
      await uploadImage(); // Upload the image first

      final newContact = Contact(
        name: txtName.text,
        phone: txtPhone.text,
        chatConversation: txtChatConversation.text,
        date: dateString.value,
        time: timeString.value,
        imageUrl: imageUrl.value, // Save the uploaded image URL
      );

      CRUDService().addNewContacts(
        newContact.name,
        newContact.phone,
        newContact.imageUrl,
        newContact.chatConversation,
        newContact.date,
      );

      Get.snackbar("Success", "Contact saved successfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}*/

class ContactController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final txtName = TextEditingController();
  final txtPhone = TextEditingController();
  final txtChatConversation = TextEditingController();
  final dateString = ''.obs;
  final timeString = ''.obs;
  final imageUrl = ''.obs;
  final isLoading = false.obs;
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  Rx<DateTime?> dateTime = Rx<DateTime?>(null);
  Rx<TimeOfDay?> time = Rx<TimeOfDay?>(null);

  void selectDate(BuildContext context) async {
    dateTime.value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2025),
    );
    if (dateTime.value != null) {
      dateString.value = dateTime.value!.toString().split(" ")[0];
      dateController.text = dateString.value;
    }
  }

  void selectTime(BuildContext context) async {
    time.value = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time.value != null) {
      timeString.value = time.value!.format(context);
      timeController.text = timeString.value;
    }
  }

  // Function to pick an image from the gallery
  Future<void> selectImage() async {
    XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Start image upload
      await uploadImage(File(pickedImage.path));
    }
  }

  // Function to upload the image to Firebase Storage
  Future<void> uploadImage(File imageFile) async {
    try {
      isLoading.value = true;
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child("images/$fileName");
      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      imageUrl.value = downloadUrl;
      Get.snackbar("Success", "Image uploaded successfully",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", "Image upload failed",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Function to save the contact to Firestore
  Future<void> saveContact() async {
    if (formKey.currentState!.validate()) {
      if (imageUrl.value.isEmpty) {
        Get.snackbar("Error", "Please select an image",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      final newContact = Contact(
        name: txtName.text,
        phone: txtPhone.text,
        chatConversation: txtChatConversation.text,
        date: dateString.value,
        time: timeString.value,
        imageUrl: imageUrl.value,
      );

      await addNewContactToFirestore(newContact);

      Get.snackbar("Success", "Contact saved successfully",
          snackPosition: SnackPosition.BOTTOM);

      // Clear the fields after saving
      clearFields();
    }
  }

  // Function to add the contact data to Firestore
  Future<void> addNewContactToFirestore(Contact contact) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User not logged in");
      }
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection("contacts")
          .add(contact.toJson());
      print("Document Added");
    } catch (e) {
      Get.snackbar("Error", "Failed to save contact",
          snackPosition: SnackPosition.BOTTOM);
      print(e.toString());
    }
  }

  // Clear all the form fields
  void clearFields() {
    txtName.clear();
    txtPhone.clear();
    txtChatConversation.clear();
    dateString.value = '';
    timeString.value = '';
    imageUrl.value = '';
  }

  @override
  void onClose() {
    // Dispose the controllers when the controller is removed
    txtName.dispose();
    txtPhone.dispose();
    txtChatConversation.dispose();
    super.onClose();
  }
}
