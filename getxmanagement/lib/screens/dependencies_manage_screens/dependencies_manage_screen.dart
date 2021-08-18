import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/dependencies_manage_screens/dependencies_controller/dependencies_controller.dart';
import 'package:getxmanagement/screens/dependencies_manage_screens/test_screens/get_lazyPut.dart';
import 'package:getxmanagement/screens/dependencies_manage_screens/test_screens/get_put.dart';

class DependenciesManagePage extends StatelessWidget {
  const DependenciesManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의존성 주입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => GetPutScreen(),
                  //바인딩 : 페이지로 보내주면서 사용할 컨트롤러를 주입하는 방법
                  //해주게 되면 굳이 GetPutScreen에서 Get.put을 이용해
                  //컨트롤러를 호출할필요 없이 사용할수있게된다.
                  //또한 뒤로가기버튼을 이용해 페이지를 나가게 되면 알아서 컨트롤러를 삭제해줌으로써
                  //메모리공간을 절약할수있다
                  binding: BindingsBuilder(() {
                    Get.put(DependenciesController());
                  }),
                );
              },
              child: Text('Getput'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => GetLazyPutScreen(),
                  binding: BindingsBuilder(() {
                    //put과 다른점은 버튼클릭해서 스크린으로 들어갔을때
                    //put의 경우 바로 메모리위에 컨트롤러를 올리지만
                    //lazyPut의 경우에는 컨트롤러에 접근할때 메모리위에 컨트롤러를 올린다.
                    Get.lazyPut(() => DependenciesController());
                  }),
                );
              },
              child: Text('GetLazyPut'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => GetPutScreen(),
                  binding: BindingsBuilder(() {
                    //put과 같이 접근하자마자 메모리위에 컨트롤러를 이니셜라이징한다
                    //차이점은 데이터를 받아오거나 가공처리가 필요할때,
                    //데이터를 가공한 후에 인스턴스를 처리할때 즉, 컨트롤러가 준비 끝났을때
                    //컨트롤러를 이니셜라이징해준다는것에서 차이가있다
                    Get.putAsync<DependenciesController>(() async {
                      //이기능처럼 5초가 걸리든 어느 시간이걸리는 행동을 할때
                      //그 행동이 지난 후에 컨트롤러를 넣어준다는점에서 큰 차이가 있다
                      await Future.delayed(Duration(milliseconds: 5000));
                      return DependenciesController();
                    });
                  }),
                );
              },
              child: Text('GetPutAsync'),
            ),
            ElevatedButton(
              onPressed: () {
                //위의 3가지 방법과 차이점은, 위의 3가지방법은 싱글턴방식이라고해서
                //하나만 생성해서 이를 공유하는방식이었다
                //create는 여러개를 생성할수 있다 -> 인스턴스가 여러개만들어진다
                Get.to(
                  () => GetPutScreen(),
                  binding: BindingsBuilder(() {
                    //put과의 차이점은 들어가서 버튼을 눌러보았을때 로그를 통해 확인할수 있지만
                    //여러번 클릭할때마다 인스턴스를 새로 만들어준다
                    //메모리낭비로 이어질수있기때문에 조심히사용해야한다
                    Get.create<DependenciesController>(
                        () => DependenciesController());
                  }),
                );
              },
              child: Text('GetCreate'),
            ),
          ],
        ),
      ),
    );
  }
}
