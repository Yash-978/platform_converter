import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_converter/View/Screens/Android/androidHomeScreen/androidHomePage.dart';

import '../../../../Services/CrudService.dart';
import '../../Android/androidHomeScreen/addContactsPage.dart';

// var iOsTimeController = TextEditingController();
// Duration? iOsTime;

class IOSAddContactPage extends StatefulWidget {
  const IOSAddContactPage({super.key});

  @override
  State<IOSAddContactPage> createState() => _IOSAddContactPageState();
}

class _IOSAddContactPageState extends State<IOSAddContactPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xff1974D1),
              child: Icon(
                CupertinoIcons.camera,
                color: Colors.white,
              ),
            ),
            buildPadding(
              placeholder: 'Full Name',
              controller: txtName,
              icon: CupertinoIcons.person,
            ),
            buildPadding(
              placeholder: 'Phone  Number',
              controller: txtPhone,
              icon: CupertinoIcons.phone,
            ),
            buildPadding(
              placeholder: 'Chat Conversation',
              controller: txtChatConversation,
              icon: CupertinoIcons.chat_bubble_text,
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CupertinoButton(
                    child: Icon(CupertinoIcons.calendar),
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
                  ),
                  Text(
                    dateController.text.isEmpty
                        ? "Select Date"
                        : dateController.text,
                    style: const TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: .75),
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
                  CupertinoButton(
                    child: Icon(CupertinoIcons.time),
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
                  ),
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

Padding buildPadding({
  required String placeholder,
  required IconData icon,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      prefix: Padding(
        padding: const EdgeInsets.all(8.0),
        // Add some padding around the icon
        child: Icon(icon, color: CupertinoColors.activeBlue),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Get.theme.brightness == Brightness.dark
              ? Colors.white54
              : Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
    ),
  );
}
