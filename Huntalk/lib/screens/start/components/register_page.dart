import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huntalk/controllers/user_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool phoneChecked = false;
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phone = '';
  String _email = '';
  String _password = '';

  void buttonPressed(BuildContext context) async {
    if (!phoneChecked) {
      Get.dialog(
        const Dialog(
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Center(
              child: Text(
                '휴대폰번호를 인증해주세요',
              ),
            ),
          ),
        ),
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      bool registered = await UserController.to.registerUser(
        name: _name,
        phone: _phone,
        email: _email,
        password: _password,
      );
      if (registered) {
        Future.delayed(
            const Duration(seconds: 1), () => Get.offAllNamed('/main'));
      } else {
        Get.dialog(
          Dialog(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              child: const Text('회원가입을 실패했습니다'),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('닉네임'),
              TextFormField(
                onSaved: (String? s) {
                  _name = s!;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '닉네임은 필수로 입력하셔야합니다.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('휴대폰번호'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onSaved: (String? s) {
                        _phone = s!;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return '휴대폰은 필수로 입력하셔야합니다.';
                        }
                        return null;
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        phoneChecked = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        '인증하기',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              phoneChecked
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('인증번호'),
                        TextFormField(
                          onSaved: (String? s) {
                            print('인증번호:' + s!);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '인증번호는 필수로 입력하셔야합니다.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    )
                  : Container(),
              const Text('이메일'),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? s) {
                  _email = s!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일은 필수로 입력하셔야합니다.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('비밀번호'),
              TextFormField(
                onSaved: (String? s) {
                  _password = s!;
                },
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호는 필수로 입력하셔야합니다.';
                  }
                  return null;
                },
              ),
              Center(
                child: TextButton(
                  onPressed: () => buttonPressed(context),
                  child: const Text('회원가입'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
