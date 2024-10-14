import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/Services/CrudService.dart';
import 'package:platform_converter/View/Screens/Android/androidHomeScreen/addContactsPage.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: CRUDService().getContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            // children: [
            children: snapshot.data!.docs
                .map(
                  (DocumentSnapshot document) {
                    Map<String, dynamic>? data =
                        document.data()! as Map<String, dynamic>;
                    return ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return UpdateContact(
                                docID: document.id,
                                chatConversation: data["chatConversation"],
                                name: data["name"],
                                phone: data["phone"],
                              );
                            },
                          );
                        },
                        leading: CircleAvatar(
                          radius: 25,
                          child: Text(data["name"][0]),
                        ),
                        title: Text(data["name"]),
                        // subtitle: Text(data["phone"]),
                        subtitle: Text(data["chatConversation"]),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(dateController.text),
                            Text(timeController.text),
                          ],
                        ));
                  },
                )
                .toList()
                .cast(),
            // ],
          );
        },
      ),
    );
  }
}

class UpdateContact extends StatefulWidget {
  const UpdateContact(
      {super.key,
      required this.docID,
      required this.name,
      required this.phone,
      required this.chatConversation});

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
    chatConversationController.text = widget.chatConversation;
    phoneController.text = widget.phone;
    nameController.text = widget.name;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Contact")),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  child: Text(
                    FirebaseAuth.instance.currentUser!.email
                        .toString()[0]
                        .toUpperCase(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Enter any name" : null,
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Name"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Phone"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      controller: chatConversationController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Chat Conversation"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * .9,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            CRUDService().updateContact(
                                nameController.text,
                                phoneController.text,
                                chatConversationController.text,
                                widget.docID);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(fontSize: 16),
                        ))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width * .9,
                  child: OutlinedButton(
                    onPressed: () {
                      CRUDService().deleteContact(widget.docID);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
