import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  void checkboxCallback(checkboxState){
    setState(() {
      isChecked = checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Buy Milk',
        style: TextStyle(fontSize: 14.0,
        decoration: isChecked?TextDecoration.lineThrough:null),
      ),
      trailing: TaskCheckbox(isChecked,checkboxCallback),
    );
  }
}

class TaskCheckbox extends StatelessWidget{
  final bool checkboxState;
  final Function toggleCheckboxState;
  TaskCheckbox(this.checkboxState,this.toggleCheckboxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: (value){
        toggleCheckboxState(value);
      },
    );
  }
}
