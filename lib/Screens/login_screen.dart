import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signuploginpages/Screens/signup_screen.dart';
import 'package:signuploginpages/providers/auth_provider.dart';
import 'package:signuploginpages/widgets/custom_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomField(
                label: "Email",
                fieldIcon: Icons.email,
                controller: emailController,
                validation: (val) {
                  if (val == null || val.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomField(
                label: "Password",
                fieldIcon: Icons.lock,
                controller: passwordController,
                isPassword: true,
                validation: (val) {
                  if (val == null || val.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final provider = Provider.of<AuthProvider>(context, listen: false);
                    final messenger = ScaffoldMessenger.of(context);

                    await provider.userLogin(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    if (provider.auth != null) {
                      messenger.showSnackBar(
                        SnackBar(content: Text(provider.auth!.message)),
                      );
                    }
                  }
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
