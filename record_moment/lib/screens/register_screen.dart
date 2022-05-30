import 'package:flutter/material.dart';
import 'package:record_moment/constants.dart';
import 'package:record_moment/widgets/custom_text_form_field.dart';
import 'package:record_moment/widgets/date_bottom_sheet.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = '';
  String email = '';
  String password = '';
  int birthyear = 2022;
  int birthMonth = 1;
  int birthDay = 1;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Form(
        key: key,
        child: Column(
          children: [
            CustomTextFormField(
                label: '이름',
                onSaved: (value) {
                  name = value;
                },
                validator: (value) {
                  if (value == null) return '이름을 입력해주세요!';
                  if (value.length < 2) return '2글자이상 입력해주세요!';
                  return null;
                }),
            CustomTextFormField(
              label: '이메일',
              onSaved: (value) {
                email = value;
              },
              validator: (value) {
                if (value == null) return '이메일을 입력해주세요!';
                if (kEmailRegExp.allMatches(value).isEmpty) {
                  return '이메일형식을 확인해주세요!';
                }
                return null;
              },
              inputType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              label: '비밀번호',
              onSaved: (value) {
                password = value;
              },
              validator: (value) {
                if (value == null) return '비밀번호를 입력해주세요!';
                if (value.length < 6) return '6글자이상 입력해주세요!';
                return null;
              },
              inputType: TextInputType.visiblePassword,
              obsecure: true,
            ),
            GestureDetector(
              onTap: () async {
                List<int>? result = await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const DateBottomSheet();
                  },
                );
                if(result!=null){
                  setState(() {
                    birthyear = result[0];
                    birthMonth = result[1];
                    birthDay = result[2];
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('$birthyear년 $birthMonth월 $birthDay일'),
              ),
            ),
            TextButton(onPressed: (){
              if( key.currentState!.validate()){
                key.currentState!.save();
                print('name : $name\nemail : $email\npassword : $password');
              }
            }, child: Text('회원가입'),),
          ],
        ),
      ),
    );
  }
}
