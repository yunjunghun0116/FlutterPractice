import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingsPage> {
  List<String> titleList = [
    '공지, 서비스 정보 PUSH 알림 수신','서비스와 관련된 공지 및 정보를 받으실\n수 있습니다.',
    '마케팅 PUSH 알림 수신' , '이벤트, 쿠폰 혜택 정보를 PUSH 알림으로\n받으실 수 있습니다.',
    '마케팅 SNS 수신' , '이벤트, 쿠폰 혜택 정보를 SMS로 받으실\n수 있습니다',
    '마케팅, 이메일 수신' ,'이벤트, 쿠폰 혜택 정보를 이메일로 받으실\n수 있습니다.'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text(
                '설정',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black)),

            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: (){
                Get.back();
              },
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                settingSwitch(titleList[0], titleList[1]),
                Divider(thickness: 1,),
                settingSwitch(titleList[2], titleList[3]),
                Divider(thickness: 1,),
                settingSwitch(titleList[4], titleList[5]),
                Divider(thickness: 1,),
                settingSwitch(titleList[6], titleList[7]),
                Divider(thickness: 1,),
                ],
              )
    )
    );
  }

  settingSwitch(String ar1, String ar2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
           children: [
             Text(ar1,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
             Text(ar2,style: TextStyle(color:Colors.black26,fontSize: 12,fontWeight: FontWeight.bold),)
           ],
        ),
        FlutterSwitch(
          activeColor: const Color(0xFFb4875e),
            inactiveColor: Colors.black12,
            value: false,
            onToggle: (value){
        }
        )
      ],
    );
  }



}
