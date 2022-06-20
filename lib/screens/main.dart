import "package:flutter/material.dart";

import 'package:http/http.dart' as http;
import 'package:heavytransportship/screens/BaseLayout.dart';
import 'package:heavytransportship/screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'ibrahim shaban';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: signin()
    );
  }

  Future<dynamic> login() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty){
      var response = await http.post(
          Uri.parse(
              'https://transporting-heavyshippment.herokuapp.com""/api/login'),
          body: ({
            'email': emailController.text,
            'password': passwordController.text,
          }));
      if (response.statusCode == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BaseLayout()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("invalid")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("invalid")));
    }
  }
}
