import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kings_lab/profile.dart';

import 'api.dart';


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home:Login()));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  void UserLogin() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };
    print(data);
    var res = await Api().authData(data, '/login');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => home()));
    } else {
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor:Colors.blueGrey,
                radius: 75,
                child: Icon(Icons.person,size: 150,color: Colors.white,),
              ),
              SizedBox(height: 20,),
              Padding(
                padding:EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    label: Text("Email"),border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30),
                  ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding:EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    label: Text("Password"),suffixIcon:Icon(Icons.remove_red_eye),border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30),
                  ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(height: 40,
                width: 120,
                decoration:BoxDecoration(color:Colors.blue,borderRadius:BorderRadius.circular(20),),
                child: TextButton(onPressed: (){
                  UserLogin();
                }, child: Text("Login now",style:TextStyle(color:Colors.white),),),
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: (){}, child: Text("Forgot password?",style:TextStyle(color:Colors.black),),),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?",style:TextStyle(color:Colors.black),),
                  TextButton(onPressed: (){
                  }, child: Text("Sign up now",style:TextStyle(color:Colors.blue),),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


