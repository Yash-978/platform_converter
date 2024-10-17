/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../Services/CrudService.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
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
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Text(data["name"][0]),
                      ),
                      title: Text(data["name"]),
                      // subtitle: Text(data["phone"]),
                      subtitle: Text(
                        data["chatConversation"],
                      ),
                      trailing:
                          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                    );
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
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../Services/CrudService.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
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
                  onTap: () {},
                  leading: CircleAvatar(
                    child: Text(data["name"][0]),
                  ),
                  title: Text(data["name"]),
                  // subtitle: Text(data["phone"]),
                  subtitle: Text(
                    data["chatConversation"],
                  ),
                  trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                );
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