import 'package:becertus_proyecto/common/Personal_Info/firebase_profile.dart';
import 'package:flutter/material.dart';

class EmailUsers extends StatefulWidget {
  const EmailUsers({super.key});

  @override
  State<EmailUsers> createState() => _EmailUsersState();
}

class _EmailUsersState extends State<EmailUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
          future: getConfigProfile(),
          builder: ((context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data?[index]['name']);
              },
            );
          })),
    );
  }
}
