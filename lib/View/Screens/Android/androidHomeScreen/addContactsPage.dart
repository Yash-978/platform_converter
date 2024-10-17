/*
import 'package:flutter/material.dart';
import 'package:platform_converter/Services/CrudService.dart';

import 'androidHomePage.dart';

TextEditingController txtName = TextEditingController();
TextEditingController txtPhone = TextEditingController();
TextEditingController txtChatConversation = TextEditingController();
TextEditingController txtEmail = TextEditingController();
TextEditingController timeController = TextEditingController();
TextEditingController dateController = TextEditingController();
DateTime? dateTime;
TimeOfDay? time;

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              child: Icon(Icons.camera_alt),
              // backgroundImage:AssetImage('') ,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: txtName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.010,
                  ),
                  TextField(
                    controller: txtPhone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.010,
                  ),
                  TextField(
                    controller: txtChatConversation,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.chat_outlined),
                      hintText: 'Chat Conversation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () async {
                         dateTime = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1947),
                          lastDate: DateTime(2025),
                          initialDate: DateTime.now(),
                        );
                        if (dateTime != null) {
                          setState(() {
                            dateController.text =
                                dateTime.toString().split(" ")[0];
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.date_range_rounded,
                      )),
                  Text(
                    dateController.text.isEmpty
                        ? "Select Date"
                        : dateController.text,

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: const Color(0xff2a7f62),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      label: const Text(
                        'Select Time',
                        // style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            timeController.text = time!.format(context);
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.date_range_rounded,
                        // color: Colors.white,
                      )),
                  Text(
                    timeController.text.isEmpty
                        ? "Select Time"
                        : timeController.text,
                    style: const TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: .75),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: w * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    CRUDService().addNewContacts(
                      txtName.text,
                      txtPhone.text,
                      "image",
                      txtChatConversation.text,
                      "pickDate",
                      "pickTime",
                    );
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
// add_contact.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/LoginController.dart';

/*
final ContactController controller = Get.put(ContactController());

class AddContact extends StatelessWidget {
  AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Obx(() => CircleAvatar(
              //   radius: 60,
              //   backgroundImage: controller.selectedImage.value != null
              //       ? FileImage(controller.selectedImage.value!)
              //       : null,
              //   child: controller.selectedImage.value == null
              //       ? IconButton(
              //     icon: const Icon(Icons.camera_alt),
              //     onPressed: controller.pickImage,
              //   )
              //       : null,
              // )),

              const CircleAvatar(
                radius: 60,
                child: Icon(Icons.camera_alt),
              ),

              _buildTextField(controller.txtName, "Full Name", Icons.person),
              SizedBox(height: h * 0.010),
              _buildTextField(controller.txtPhone, "Phone Number", Icons.call),
              SizedBox(height: h * 0.010),
              _buildTextField(controller.txtChatConversation,
                  "Chat Conversation", Icons.chat_outlined),
              Row(
                children: [
                  IconButton(
                    onPressed: () => controller.selectDate(context),
                    icon: const Icon(Icons.date_range_rounded),
                  ),
                  Obx(() => Text(
                        controller.dateString.value.isEmpty
                            ? "Select Date"
                            : controller.dateString.value,
                      )),
                ],
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => controller.selectTime(context),
                    icon: const Icon(Icons.date_range_rounded),
                    label: const Text('Select Time'),
                  ),
                  Obx(() => Text(
                        controller.timeString.value.isEmpty
                            ? "Select Time"
                            : controller.timeString.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: .75,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 50,
                width: w * 0.9,
                child: ElevatedButton(
                  onPressed: controller.saveContact,
                  child: const Text("Save", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hintText, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
*/
/*
final ContactController controller = Get.put(ContactController());

class AddContact extends StatelessWidget {
  AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircleAvatar with image selection functionality
              Obx(() => CircleAvatar(
                    radius: 60,
                    backgroundImage: controller.imageUrl.value.isNotEmpty
                        ? NetworkImage(controller.imageUrl.value)
                        : null,
                    child: controller.imageUrl.value.isEmpty
                        ? IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: controller.selectImage,
                          )
                        : null,
                  )),
              SizedBox(height: h * 0.02),

              // Full Name TextField
              _buildTextField(
                  controller.txtName, "Full Name", Icons.person, true),
              SizedBox(height: h * 0.010),

              // Phone Number TextField
              _buildTextField(
                  controller.txtPhone, "Phone Number", Icons.call, true),
              SizedBox(height: h * 0.010),

              // Chat Conversation TextField
              _buildTextField(controller.txtChatConversation,
                  "Chat Conversation", Icons.chat_outlined, false),

              // Date selection
              Row(
                children: [
                  IconButton(
                    onPressed: () => controller.selectDate(context),
                    icon: const Icon(Icons.date_range_rounded),
                  ),
                  Obx(() => Text(
                        controller.dateString.value.isEmpty
                            ? "Select Date"
                            : controller.dateString.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )),
                ],
              ),
              SizedBox(height: h * 0.010),

              // Time selection
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => controller.selectTime(context),
                    icon: const Icon(Icons.access_time),
                    label: const Text('Select Time'),
                  ),
                  Obx(() => Text(
                        controller.timeString.value.isEmpty
                            ? "Select Time"
                            : controller.timeString.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: .75,
                        ),
                      )),
                ],
              ),
              SizedBox(height: h * 0.02),

              // Save Button
              SizedBox(
                height: 50,
                width: w * 0.9,
                child: ElevatedButton(
                  onPressed: controller.saveContact,
                  child: Obx(() => controller.isLoading.value
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          "Save",
                          style: TextStyle(fontSize: 16),
                        )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build TextFields
  Widget _buildTextField(TextEditingController textController, String hintText,
      IconData icon, bool isRequired) {
    return TextFormField(
      controller: textController,
      validator: isRequired
          ? (value) {
              if (value == null || value.isEmpty) {
                return '$hintText is required';
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:platform_converter/Services/CrudService.dart';

import 'androidHomePage.dart';

var timeController = TextEditingController();
final formKey = GlobalKey<FormState>();
var dateController = TextEditingController();

class AddContact extends StatefulWidget {
  AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              child: Icon(Icons.camera_alt),
              // backgroundImage:AssetImage('') ,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: txtName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.010,
                  ),
                  TextField(
                    controller: txtPhone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.010,
                  ),
                  TextField(
                    controller: txtChatConversation,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.chat_outlined),
                      hintText: 'Chat Conversation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () async {
                        DateTime? dateTime = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1947),
                          lastDate: DateTime(2025),
                          initialDate: DateTime.now(),
                        );
                        if (dateTime != null) {
                          setState(() {
                            dateController.text =
                            dateTime.toString().split(" ")[0];
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.date_range_rounded,
                      )),
                  Text(
                    dateController.text.isEmpty
                        ? "Select Date"
                        : dateController.text,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: const Color(0xff2a7f62),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      label: const Text(
                        'Select Time',
                        // style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            timeController.text = time.format(context);
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.date_range_rounded,
                        // color: Colors.white,
                      )),
                  Text(
                    timeController.text.isEmpty
                        ? "Select Time"
                        : timeController.text,
                    style: const TextStyle(
                      // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: .75),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: w * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    CRUDService().addNewContacts(
                      txtName.text,
                      txtPhone.text,
                      "image",
                      txtChatConversation.text,
                      "pickDate",
                      "pickTime",
                    );
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}