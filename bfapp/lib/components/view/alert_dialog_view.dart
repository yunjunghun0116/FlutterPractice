
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogView extends StatelessWidget {

  final Function(bool isConfirm)? onTap;
  final String? title;
  final String? content;
  final String? cancel;
  final String? confirm;
  final bool selectMode;

  const AlertDialogView({Key? key,
    this.title,
    this.content,
    this.cancel,
    this.confirm,
    this.selectMode = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Visibility(
        visible: title != null,
        child: Column(
          children: [
            Text(title ?? ''),
            const SizedBox(height: 10)
          ],
        ),
      ),
      content: Visibility(
        visible: content != null,
        child: Text(content ?? ''),
      ),
      actions: getActions()
    );
  }

  List<Widget> getActions() {
    List<Widget> actions= [];

    if(selectMode || cancel != null) { // 두개 선택모드
      actions.add(TextButton(onPressed: () {
        Get.back();
        onTap?.call(false);
      }, child: Text(cancel ?? "취소")));
    }
    actions.add(TextButton(onPressed: () {
      Get.back();
      onTap?.call(true);
    }, child: Text(confirm ?? "확인")));
    return actions;
  }


}