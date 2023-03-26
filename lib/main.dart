import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/service/user_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserService _service=UserService();

  List<Datum> users=[];

  @override
  void initState() {
    super.initState();
    _service.fetchUsers().then((value) {
      if(value!=null && value.data!=null){
        setState(() {
          users=value.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      
      home:Scaffold(
        appBar:AppBar(
          title:Text("Maretial App Bar"),
        ),
        body:ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${users[index].firstName!+users[index].lastName!}"),
              subtitle:Text(users[index].email!),
              leading: CircleAvatar(
                backgroundImage:NetworkImage(users[index].avatar!),
              ),
            );

          },
        ),
      ),
    );
  }
}