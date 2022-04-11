import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../shared/constants.dart';
import './sign_in.dart';


class Forgot extends StatefulWidget{
  const Forgot({Key key}) : super (key: key);

  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot>{
  //form key
  final _formkey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validator
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value){
        emailController.text = value;
      },
      textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
              BorderSide(color:  Color(0xFFF5F3ED), width: 1.5),
            ),
            fillColor: Colors.white,
            filled: true,
            labelText: "Email",
            labelStyle: TextStyle(color: fontType),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),

    );


    final forgotButton = Material(
      elevation: 5,
      borderRadius:  BorderRadius.circular(10),
      color: Color(0xff4CA7F8),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(100,5,100,5),
          //minWidth: MediaQuery.of(context.size!.width),

          onPressed: (){
            send();



          },
          child: const Text(
            "Send Reset link",
            textAlign:TextAlign.center ,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),),
        ),
      );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5F3ED),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Color(0xff4CA7F8)),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>  SignIn()),);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color:Color(0xFFF5F3ED),
            child: Column(
              children: [
                SizedBox(

                  child: Image.asset(
                    "images/logo3-.png",
                    height: 50,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[


                        // SizedBox(height: 5,),
                        // const Text("Campusell",
                        //   style: TextStyle(
                        //       fontSize: 20.0,
                        //       color: Color(0xff4CA7F8),
                        //       fontStyle: FontStyle.italic),),
                        SizedBox(height: 100,),
                        emailField,

                        SizedBox(height: 35,),
                        forgotButton,

                      ],
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

  Future<void> send() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState?.save();
      try {

        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Sent"),
            content: const Text("Check your email to reset password"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("okay"),
              ),
            ],
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }


}

