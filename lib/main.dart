import 'package:flutter/material.dart';
import 'package:student_form/Screens/login_page.dart';
import 'package:student_form/Screens/registration_page.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Main());
}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
  home: LoginPage(),
    );
  }
}
