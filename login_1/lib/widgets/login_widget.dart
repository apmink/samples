import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  final Function swapBR;
  // bool setBR;
  const LoginWidget({
    Key? key,
    required this.swapBR,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 500,
      height: 273,
      padding: const EdgeInsets.only(left: 5, top: 5),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              'Login',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerRight,
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.black,
                // shape: const RoundedRectangleBorder(
                //     borderRadius: BorderRadius.only(
                //   bottomRight: Radius.circular(50),
                //   topRight: Radius.circular(50),
                // )),
                child: SizedBox(
                  // height: 100,
                  width: 300,
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const Icon(Icons.person),
                            ),
                            Container(
                              width: 250,
                              margin: const EdgeInsets.only(left: 5),
                              child: TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Username',
                                ),
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Username cannot be blank'
                                      : null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const Icon(Icons.lock_outline),
                            ),
                            Container(
                              width: 250,
                              margin: const EdgeInsets.only(left: 5),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                ),
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Password cannot be blank'
                                      : null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -25,
                // top: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _usernameController.clear();
                        _passwordController.clear();
                      } else {
                        null;
                      }
                    },
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => widget.swapBR(),
            child: const Text("swap"),
          ),
        ],
      ),
    );
  }
}
