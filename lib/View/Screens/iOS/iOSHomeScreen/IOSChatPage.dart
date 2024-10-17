import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Services/CrudService.dart';
import '../../Android/androidHomeScreen/ChatPage.dart';

class IOSChatPage extends StatelessWidget {
  const IOSChatPage({super.key});

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
            children: snapshot.data!.docs
                .map(
                  (DocumentSnapshot document) {
                    Map<String, dynamic>? data =
                        document.data()! as Map<String, dynamic>;

                    String name = data["name"] ?? "Unknown";
                    String chatConversation =
                        data["chatConversation"] ?? "No conversation";
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
                        trailing: Icon(CupertinoIcons.phone));
                  },
                )
                .toList()
                .cast(),
          );
        },
      ),
    );
  }
}
