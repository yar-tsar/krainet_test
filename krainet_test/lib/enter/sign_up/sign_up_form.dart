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
  final _confirmPassController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  bool _isFormFilled = false;

  @override
  void dispose() {
    _nameController.dispose();
    _birthdayController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
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
              controller: _birthdayController,
              decoration: const InputDecoration(
                labelText: 'date of birth',
                helperText: '',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.black,
                  ),
                  onPressed: null,
                ),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now());

                if (pickedDate != null) {
                  String formattedDate = pickedDate.toString().substring(0, 10);
                  setState(() {
                    _birthdayController.text = formattedDate;
                    filled();
                  });
                }
              },
              readOnly: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your date of birth';
                }
              },
              onChanged: (value) => filled()),
          TextFormField(
              controller: _emailController,
              decoration:
                  const InputDecoration(labelText: 'e-mail', helperText: ''),
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
          TextFormField(
              controller: _confirmPassController,
              obscureText: _isConfirmPasswordObscured,
              decoration: InputDecoration(
                labelText: 'confirm password',
                helperText: '',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                    });
                  },
                  icon: Icon(
                    _isConfirmPasswordObscured
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (_passController.value != _confirmPassController.value) {
                  return 'Passwords must match';
                }
                if (value.length > 5) return null;
                {
                  return 'Password must include 6 symbols';
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
