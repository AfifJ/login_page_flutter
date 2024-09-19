import 'package:flutter/material.dart';
import 'package:login_page/components/custom_button.dart';
import 'package:login_page/components/custom_textfield.dart';
import 'package:login_page/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final String _correctEmail = 'afif@gmail.com';
  final String _correctPassword = '124220018';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_email == _correctEmail && _password == _correctPassword) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) return 'Email cannot be empty';

    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value)) return 'Masukkan email dengan benar';
    if (value != _correctEmail) return 'Email salah';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password tidak bisa kosong';
    } else if (value.length < 6) {
      return 'Minimal 6 karakter';
    } else if (value != _correctPassword) {
      return 'Password salah';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/twohuman.png',
                width: 300,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image);
                },
              ),
            ),
            const Text(
              "Hai Kawan",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
            ),
            const Text(
              "Welcome back to UPN",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (e) => _email = e ?? '',
                    validator: _validateEmail,
                    label: "Email",
                    icon: Icons.person_sharp,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    onSaved: (e) => _password = e ?? '',
                    validator: _validatePassword,
                    label: "Password",
                    obsecure: true,
                    icon: Icons.lock,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      CustomButton(text: "Login", onPressed: _submit),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Belum punya akun?"),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'email: $_correctEmail\npassword: $_correctPassword')),
                          );
                        },
                        child: const Text(
                          "Cari tahu",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
