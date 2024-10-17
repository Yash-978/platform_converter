import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Services/CrudService.dart';


class IOSCallPage extends StatelessWidget {
  const IOSCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: StreamBuilder<QuerySnapshot>(
        stream: CRUDService().getContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No contacts found"));
          }

          return ListView(
            children: snapshot.data!.docs.map(
                  (DocumentSnapshot document) {
                Map<String, dynamic>? data = document.data()! as Map<String, dynamic>;

                String name = data["name"] ?? "Unknown";
                String chatConversation = data["chatConversation"] ?? "No conversation";
                String pickDate = data["pickDate"] ?? "No date";
                String pickTime = data["pickTime"] ?? "No time";

                return CupertinoListTile(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return UpdateContact(
                          docID: document.id,
                          chatConversation: chatConversation,
                          name: name,
                          phone: data["phone"] ?? "No phone",
                        );
                      },
                    );
                  },
                  leading: CircleAvatar(
                    radius: 25,
                    child: Text(name[0]),
                  ),
                  title: Text(name),
                  subtitle: Text(chatConversation),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(pickDate),
                      SizedBox(height: 4),
                      Text(pickTime),
                    ],
                  ),
                );
              },
            ).toList().cast(),
          );
        },
      ),

    );
  }
}

class UpdateContact extends StatefulWidget {
  const UpdateContact({
    super.key,
    required this.docID,
    required this.name,
    required this.phone,
    required this.chatConversation,
  });

  final String docID, name, phone, chatConversation;

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController chatConversationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    chatConversationController.text = widget.chatConversation;
    phoneController.text = widget.phone;
    nameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Update Contact"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            CRUDService().deleteContact(widget.docID);
            Navigator.pop(context);
          },
          child: Icon(CupertinoIcons.delete, color: CupertinoColors.destructiveRed),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                child: Text(
                  FirebaseAuth.instance.currentUser!.email.toString()[0].toUpperCase(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              CupertinoTextField(
                controller: nameController,
                placeholder: "Name",
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              SizedBox(height: 10),
              CupertinoTextField(
                controller: phoneController,
                placeholder: "Phone",
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              SizedBox(height: 10),
              CupertinoTextField(
                controller: chatConversationController,
                placeholder: "Chat Conversation",
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              SizedBox(height: 20),
              CupertinoButton.filled(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    CRUDService().updateContact(
                      nameController.text,
                      phoneController.text,
                      chatConversationController.text,
                      widget.docID,
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
