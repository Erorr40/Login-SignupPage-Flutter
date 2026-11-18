import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signuploginpages/providers/auth_provider.dart';
import 'package:signuploginpages/widgets/custom_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomField(
                  label: "Name",
                  fieldIcon: Icons.person,
                  controller: nameController,
                  validation: (val) {
                    if (val == null || val.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
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
                  label: "Phone",
                  fieldIcon: Icons.phone,
                  controller: phoneController,
                  validation: (val) {
                    if (val == null || val.isEmpty) {
                      return "Phone is required";
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
                      final navigator = Navigator.of(context);

                      await provider.userSignUp(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        password: passwordController.text,
                      );

                      if (provider.auth != null) {
                        messenger.showSnackBar(
                          SnackBar(content: Text(provider.auth!.message)),
                        );
                        if (provider.auth!.status) {
                          navigator.pop();
                        }
                      }
                    }
                  },
                  child: const Text("Sign Up"),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Already have an account? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
