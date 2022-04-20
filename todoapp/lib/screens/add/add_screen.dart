import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:todoapp/constants.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:todoapp/screens/add/components/add_screen_text_field.dart';
import 'package:todoapp/utils/local_utils.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController _dateTimeController = TextEditingController();

  String todo = '';
  DateTime dateTime = DateTime.now();

  void addTodo(){
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      TodoController.to.addTodo(dateTime: dateTime, todo: todo);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 추가'),
        actions: [
          GestureDetector(
            onTap: addTodo,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              alignment: Alignment.center,
              child: const Text('추가'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AddScreenTextField(
                label: 'Todo',
                onSaved: (val) {
                  todo = val;
                },
                validator: (val) {
                  if(val.isEmpty || val.length <=1) return '2글자 이상 할일을 적어주세요';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(2022, 4, 1),
                    maxTime: DateTime(2023, 4, 1),
                    onConfirm: (date) {
                      _dateTimeController.text = getDateTime(date);
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.ko,
                  );
                },
                child: SizedBox(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            '목표일자',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _dateTimeController,
                        enabled: false,
                        decoration: const InputDecoration(
                          disabledBorder: underlineGreyBorder,
                        ),
                        validator: (val) {
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
