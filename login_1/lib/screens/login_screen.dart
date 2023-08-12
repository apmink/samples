import 'package:flutter/material.dart';
import 'package:flutter_login_template_1/widgets/login_screen_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 127, 34),
                Color.fromARGB(255, 51, 255, 78),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.4,
                1.0,
              ],
              tileMode: TileMode.clamp),
        ),
        child: const Center(
          child: LoginScreenWidget(),
        ),
      ),
    );
  }
}
