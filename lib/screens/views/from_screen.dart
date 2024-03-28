import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ux_project/controllers/auth/login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: controller.emailController.value,
                      // onChanged: (value) => controller.emailController.value = value,
                      decoration: const InputDecoration(labelText: 'E-Mail'),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) => print(value),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Invalid email!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                        controller: controller.passwordController.value,
                        decoration:
                            const InputDecoration(labelText: 'password'),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty && value.length < 7) {
                            return 'Invalid password!';
                          }
                          return null;
                        }),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                      child: Text("Submit"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
