import 'package:app/components/view/alert_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewUtils {

  static void showAlertDialog({title, content, cancel, confirm, Function(bool isConfrim)? onTap}) {
    Get.dialog(
        AlertDialogView(
          title: title,
          content: content,
          cancel: cancel,
          confirm: confirm,
          onTap: (isConfirm) => onTap?.call(isConfirm)),
        barrierDismissible: false
    );
  }

  static Future<void> showLoading() async {
    if(Get.isDialogOpen == true) { return; }
    Future.microtask(() => Get.dialog(const Center(
        child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
                color: Colors.white))),
        barrierDismissible: false)
    );
  }

  static Future<void> hideLoading() async {
    if(Get.isDialogOpen == true) {
      Future.microtask(() => Get.back());
    }
  }
}