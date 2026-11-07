import 'package:flutter/material.dart';
import 'package:project_64e/auth/register_page.dart';
import 'package:project_64e/widget/input_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final _supabase = Supabase.instance.client;

  void login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    setState(() {
      _isLoading = true;
    });
    try {
      await _supabase.auth.signInWithPassword(email: email, password: password);
      _emailController.clear();
      _passwordController.clear();
    } on AuthApiException catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Color.fromARGB(255, 157, 170, 82),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 350,
          child: Card(
            color: Color.fromARGB(255, 157, 170, 82),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login Form", style: TextStyle(fontSize: 20)),
                    SizedBox(height: 30),
                    InputField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field is empty!!";
                        }
                        // if (!RegExp(r'cse_\d{16}@lus.ac.bd').hasMatch(value)) {
                        //   return "Enter institutional email";
                        // }

                        return null;
                      },
                      labelText: "Email",
                      hintText: "Enter email",
                      prefixIcon: Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    InputField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field is empty!!";
                        }
                        return null;
                      },
                      labelText: "Password",
                      hintText: "Enter password",
                      prefixIcon: Icon(Icons.lock),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                      },
                      child:
                          _isLoading
                              ? CircularProgressIndicator()
                              : Text("Login"),
                    ),
                    SizedBox(height: 20),

                    GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          ),
                      child: Text("Don't have an account? Register"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
