import 'package:flutter/material.dart';
import 'package:flutter_login_template_1/widgets/login_widget.dart';
import 'package:flutter_login_template_1/widgets/register_widget.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  BorderRadius br1 = const BorderRadius.only(
    // bottomLeft: Radius.elliptical(50, 20),
    // bottomRight: Radius.elliptical(300, 150),
    // topLeft: Radius.elliptical(50, 20),
    // topRight: Radius.elliptical(300, 150),
  );

  BorderRadius br2 = const BorderRadius.only(
    // bottomLeft: Radius.elliptical(300, 150),
    // bottomRight: Radius.elliptical(50, 20),
    // topLeft: Radius.elliptical(300, 150),
    // topRight: Radius.elliptical(50, 20),
  );

  bool setBR = false;

  swapBR() {
    setState(() {
      setBR = !setBR;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      // width: 500,
      // height: 400,
      padding: const EdgeInsets.symmetric(vertical: 10),
      // margin: EdgeInsets.symmetric(horizontal: 5),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        color: Colors.white,
        // color: Theme.of(context).accentColor,
        borderRadius: setBR ? br2 : br1,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: setBR
            ? RegisterWidget(swapBR: swapBR)
            : LoginWidget(swapBR: swapBR),
        transitionBuilder: (child, animation) {
          final offsetAnimation = Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: const Offset(0.0, 0.0))
              .animate(animation);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
