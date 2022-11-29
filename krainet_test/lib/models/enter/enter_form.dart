import 'package:flutter/material.dart';
import 'package:krainet_test/application/sign_in_function.dart';
import 'package:krainet_test/models/enter/sign_up/sign_up_route.dart';
import 'package:krainet_test/models/main_page/main_route.dart';

class EnterForm extends StatefulWidget {
  const EnterForm({Key? key}) : super(key: key);

  @override
  State<EnterForm> createState() => _EnterFormState();
}

class _EnterFormState extends State<EnterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isFormFilled = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void filled() => setState(() {
        if (_formKey.currentState!.validate() == true) {
          _isFormFilled = true;
        } else {
          _isFormFilled = false;
        }
      });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 15,
          ),
          TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'e-mail',
                helperText: '',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your e-mail';
                }
                String p =
                    "[a-zA-Z0-9+._%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                RegExp regExp = RegExp(p);

                if (regExp.hasMatch(value)) return null;

                return 'Please enter correct e-mail';
              },
              onChanged: (value) => filled()),
          TextFormField(
              controller: _passController,
              obscureText: _isPasswordObscured,
              decoration: InputDecoration(
                labelText: 'password',
                helperText: '',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordObscured = !_isPasswordObscured;
                    });
                  },
                  icon: Icon(
                    _isPasswordObscured
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length > 5) return null;

                return 'Password must include 6 symbols';
              },
              onChanged: (value) => filled()),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor:
                  _isFormFilled ? const Color(0xFF3CCB75) : Colors.grey,
              foregroundColor:
                  _isFormFilled ? Colors.white : const Color(0xFFD9D9D9),
            ),
            onPressed: () {
              if (signIn(_emailController.text, _passController.text,
                      _isFormFilled) !=
                  false) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainRoute(),
                    ),
                    (route) => false);
              } else {
                SnackBarAction(
                  label: 'Some error ocured',
                  onPressed: () {},
                );
              }
            },
            child: const Text('Sign In'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('or'),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: const Color(0xFF3CCB75),
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpRoute(),
                )),
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
