// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:student_form/Screens/details_show.dart';
import 'package:student_form/Screens/registration_page.dart';
import 'package:student_form/custom_widgets/custom_text_field.dart';
import 'package:student_form/database/database_services.dart';

import '../class_model/class_values.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final textEditor1=TextEditingController();
  final textEditor2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(color: Colors.black,fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/img.png',
                ),
                fit: BoxFit.cover)),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Email address')),
                        CustomTextField(text: 'Email', con: textEditor1,),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Password')),
                        CustomTextField(text: 'password', con: textEditor2,),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Registration()
                            ),
                          );
                        },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple),
                          child: const Text('Login'),
                        ),
                        Text('Dont you have an account? '),
                        InkWell(onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>Registration()
                              ),);
                        },
                            child: Text('Register'))
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
