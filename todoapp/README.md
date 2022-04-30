# todoapp

GetxController 상태를 관리해주는 객체 -> Get.put() 메모리에 올린다
View -> 어떤 Controller를 사용해서 해당 함수를 진행할까? A,B,C  한 화면 A,B 두개의 컨트롤러
Get.find()
ControllerA A = Get.put(ControllerA());
ControllerB B = Get.put(ControllerB());
void A(){
    Get.find<ControllerA>().send();
    Get.find<ControllerB>().send();
}

Create Read Update Delete
