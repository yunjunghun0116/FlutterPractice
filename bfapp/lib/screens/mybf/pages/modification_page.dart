import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ModificationPage extends StatefulWidget {
  const ModificationPage({Key? key}) : super(key: key);

  @override
  _ModificationPageState createState() => _ModificationPageState();
}

class _ModificationPageState extends State<ModificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: const Text(
          '회원정보 수정',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black)),

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
      body: Stack(
        children: [
          ListView(
            children: [
              modify(),
              const Divider(thickness: 3.0,),
              account()
            ],
          )
        ],
      ),
    )
    );
  }
  Widget settingContent(String title, String key, String value){
    return Container(
      child: ListTile(
        onTap: () async {
          Get.toNamed(key);
        },
        title: Text(title),
        trailing: SizedBox(width: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
              const Icon(Icons.arrow_forward_ios,color: Colors.black54,)
            ],
          ),),
      ),
    );
  }

  Widget modify(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        settingContent('비밀번호 변경', 'modification', ''),
        Text('    비밀번호를 변경할 수 있습니다', style:TextStyle(color: Colors.black26),),
        const Divider(thickness: 1.0,),
        settingContent('휴대폰 변경', 'modification', ''),
        const Divider(thickness: 1.0,),
        settingContent('이메일', 'modification', ''),
        Text('    이메일을 등록해주세요', style: TextStyle(color: Colors.black26),),
      ],
    );
  }

  Widget account() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        settingContent('로그아웃', 'modification', ''),
        const Divider(thickness: 1.0,),
        settingContent('탈퇴', 'modification', '')
      ],
    );
  }
}

