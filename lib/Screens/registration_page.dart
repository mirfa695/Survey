// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:student_form/Screens/details_show.dart';
import 'package:student_form/custom_widgets/custom_text_field.dart';
import 'package:student_form/database/database_services.dart';

import '../class_model/class_values.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "A+ve", child: Text("A+ve")),
      const DropdownMenuItem(value: "A-ve", child: Text("A-ve")),
      const DropdownMenuItem(value: "B+ve", child: Text("B+ve")),
      const DropdownMenuItem(value: "B-ve", child: Text("B-ve")),
      const DropdownMenuItem(value: "O+ve", child: Text("O+ve")),
      const DropdownMenuItem(value: "O-ve", child: Text("O-ve")),
      const DropdownMenuItem(value: "AB+ve", child: Text("AB+ve")),
      const DropdownMenuItem(value: "AB-ve", child: Text("AB-ve")),
    ];
    return menuItems;
  }

  String selectedValue = "A+ve";
  final textEditor1=TextEditingController();
  final textEditor2=TextEditingController();
  final textEditor3=TextEditingController();
  final textEditor4=TextEditingController();
  final DB =DatabaseServices();
  @override
  void initState() {
    DB.initDatabase();
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Create Profile',
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
            height: 630,
            width: 330,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Student Profile',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(alignment: Alignment.topLeft, child: Text('Full Name')),
                    CustomTextField(text: 'Name', con: textEditor1,),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Email address')),
                    CustomTextField(text: 'Email', con: textEditor2,),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Phone number')),
                    CustomTextField(text: 'Ph no', con: textEditor3,),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Date of birth')),
                    CustomTextField(text: 'DOB', con: textEditor4,),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft, child: Text('Blood group')),
                    DropdownButtonFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async{
                        String name=textEditor1.text.toString();
                        String email=textEditor2.text.toString();
                        String phno=textEditor3.text.toString();
                        String dob=textEditor4.text.toString();
                        String value=selectedValue;

                        final values=Values(
                            name: name, email: email, phno: phno, dob: dob, blood: value);
                        print(values);
                        await DB.insertStudents(values);
                        List<Values>list=await DB.details();
                        print(list);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailsShow(info:list, objvalues: DB,)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      child: const Text('Submit'),
                    )
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
