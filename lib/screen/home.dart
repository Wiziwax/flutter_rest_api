import 'package:flutter/material.dart';
import 'package:flutter_rest_api/services/user_api.dart';

import '../models/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          final first = user.name.first ?? ''; // Null check added here
          // final color = user.gender == 'male' ? Colors.blue : Colors.pink;
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.phone),
            // tileColor: color,
            // child: Text('${index + 1}')),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchUsers,
      // ),
    );
  }


  Future<void> fetchUsers() async{
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

}
