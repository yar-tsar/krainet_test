import 'package:flutter/material.dart';
import 'package:krainet_test/enter/sign_up/sign_up_route.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _checkPassController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isFormFilled = false;

  @override
  void dispose() {
    _nameController.dispose();
    _birthdayController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _checkPassController.dispose();
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
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'name',
                helperText: '',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
              },
              onChanged: (value) => filled()),
          TextFormField(
              controller: _passController,
              decoration: const InputDecoration(
                  labelText: 'date of birth', helperText: ''),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your date of birth';
                }
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
            ),
            onPressed: null,
            /*() => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpRoute(),
                )), */
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
