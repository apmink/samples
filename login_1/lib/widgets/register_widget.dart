import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  final Function swapBR;
  // bool setBR;
  const RegisterWidget({
    Key? key,
    required this.swapBR,
  }) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      padding: const EdgeInsets.only(right: 5, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(right: 32),
            alignment: Alignment.topRight,
            child: Text(
              'Register',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.black,
                // shape: const RoundedRectangleBorder(
                //     borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(50),
                //   topLeft: Radius.circular(50),
                // )),
                child: SizedBox(
                  // height: 150,
                  width: 350,
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                  // border: InputBorder.none,
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
                        // const Divider(
                        //   height: 1,
                        //   color: Colors.black,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const Icon(Icons.email),
                            ),
                            Container(
                              width: 250,
                              margin: const EdgeInsets.only(left: 5),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  // border: InputBorder.none,
                                  hintText: 'Email Address',
                                ),
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Email cannot be blank'
                                      : null;
                                },
                              ),
                            ),
                          ],
                        ),
                        // const Divider(
                        //   height: 1,
                        //   color: Colors.black,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                left: -25,
                // top: 53,
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
                        _emailController.clear();
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => widget.swapBR(),
              child: const Text("swap"),
            ),
          ),
        ],
      ),
    );
  }
}
