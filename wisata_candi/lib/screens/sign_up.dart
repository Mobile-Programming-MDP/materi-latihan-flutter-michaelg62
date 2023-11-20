import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _obscurePassword = true;

  void _signUp() {
    String name = _nameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#\\\$%^&*(),.?":{}|<>]'))) {}
    print('*** Sign Up Berhasil!');
    print('Nama: $name');
    print('Nama Pengguna: $username');
    print('Password: $password');
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(),
              const SizedBox(height: 20,),
              TextFormField(),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  errorText: _errorText.isNotEmpty ? _errorText : null,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.lock)),
                ),
                obscureText: _obscurePassword,
              ),
            const SizedBox(height: 20,),
            ],
          )),
        ),
      )),
    );
  }
}
