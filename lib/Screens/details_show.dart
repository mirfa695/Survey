import 'package:flutter/material.dart';
import 'package:student_form/custom_widgets/custom_text_field.dart';
import 'package:student_form/database/database_services.dart';

import '../class_model/class_values.dart';

class DetailsShow extends StatefulWidget {
  DetailsShow({required this.info, required this.objvalues, Key? key})
      : super(key: key);
  List<Values> info;
  DatabaseServices objvalues;

  @override
  State<DetailsShow> createState() => _DetailsShowState();
}

class _DetailsShowState extends State<DetailsShow> {

  final Textedit1 = TextEditingController();
  final Textedit2 = TextEditingController();
  final Textedit3 = TextEditingController();
  final Textedit4 = TextEditingController();
  final Textedit5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Number of entries: ${widget.info.length}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple[200],
      body: ListView.builder(
          itemCount: widget.info.length,
          itemBuilder: (context, index) => Card(
              elevation: 50,
              child: Column(
                children: [
                  Text(
                    'Name:${widget.info[index].name.toString()}',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Text(
                    'Email:${widget.info[index].email.toString()}',
                    style: const TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  Text(
                    'PH No: ${widget.info[index].phno.toString()}',
                    style: const TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'D/O/B:${widget.info[index].dob.toString()}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 10),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Blood group:${widget.info[index].blood.toString()}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 10),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            await widget.objvalues.initDatabase();
                            await widget.objvalues
                                .deleteTable(widget.info[index].name);
                            // await DatabaseServices().initDatabase();
                            // await DatabaseServices().deleteTable(widget.info[index].name);
                            List<Values> updatedList = List.from(widget.info)
                              ..removeAt(index);
                            setState(() {
                              widget.info = updatedList;
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.blue,
                          )),
                      //update Button
                      IconButton(
                          onPressed: () async {
                            Textedit1.text=widget.info[index].name;
                            Textedit2.text=widget.info[index].email;
                            Textedit3.text=widget.info[index].phno;
                            Textedit4.text=widget.info[index].dob;
                            Textedit5.text=widget.info[index].blood;
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('update data'),
                                    content: SingleChildScrollView(
                                      child: Form(
                                          child: Column(
                                        children: [
                                          CustomTextField(
                                              text: 'Name',
                                              con:Textedit1),
                                          CustomTextField(
                                              text: 'email',
                                              con: Textedit2),
                                          CustomTextField(
                                              text: 'ph no',
                                              con:Textedit3),
                                          CustomTextField(
                                              text: 'D/O/B',
                                              con: Textedit4),
                                          CustomTextField(
                                              text: 'Blood',
                                              con: Textedit5)
                                        ],
                                      )),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () async {
                                           await widget.objvalues.update(
                                                Values(
                                                    name: Textedit1.text,
                                                    email:Textedit2.text,
                                                    phno: Textedit3.text,
                                                    dob: Textedit4.text,
                                                    blood:Textedit5.text));
                                           widget.info=await widget.objvalues.details();


                                           setState(() {
                                             Navigator.pop(context);

                                           });
                                           // List newlist=List.from(urj as Iterable);
                                           // setState(() {
                                           //   widget.info=newlist();
                                           // });
                                          //   // List< Values>newlist=List.from(widget.info);
                                          //
                                          //   setState(() {
                                          //     widget.info=newlist;
                                          //   });
                                           },
                                          child: Text('Update')),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('close'))
                                    ],
                                  );
                                });
                            // await widget.objvalues.initDatabase();
                            // await widget.objvalues.update();
                          },
                          icon: Icon(
                            Icons.update,
                            color: Colors.blue,
                          ))
                    ],
                  )
                ],
              ))),
    );
  }
}
