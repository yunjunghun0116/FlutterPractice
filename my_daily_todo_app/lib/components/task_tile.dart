import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String? taskTitle;
  final bool? isChecked;
  final Function? checkboxCallback;
  final Function? longPressCallback;

  TaskTile({
    this.isChecked = false,
    this.taskTitle,
    this.checkboxCallback,
    this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){
        longPressCallback!();
      },
      title: Text(
        taskTitle!,
        style: TextStyle(
            fontSize: 14.0,
            decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {
          checkboxCallback!(value);
        },
      ),
    );
  }
}
//

// class TaskCheckbox extends StatelessWidget {
//   final bool? checkboxState;
//   final Function? toggleCheckboxState;
//   TaskCheckbox({this.checkboxState,this.toggleCheckboxState});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
