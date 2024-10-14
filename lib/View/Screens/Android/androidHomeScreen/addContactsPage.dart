import 'package:flutter/material.dart';
import 'package:platform_converter/Services/CrudService.dart';

import 'androidHomePage.dart';

var timeController = TextEditingController();

var dateController = TextEditingController();

class AddContact extends StatefulWidget {
  AddContact({super.key});

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
