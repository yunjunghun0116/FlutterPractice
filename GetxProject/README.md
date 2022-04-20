# getx_project

- [ ] 라우트관리
- [ ] 종속성관리
- [ ] 상태관리


종속성관리 - MVC-Controller, MVVM - ViewModel이 어떻게 서로 다른(Model,View)에 대해 의존성
A-B가 서로 얼마나 의존하느냐 즉, A가 수정되었을때 B가 많이수정되면
객체지향설계 서로에대한 의존성 감소시켜야
MVVM모델을 지향
Model View ViewModel
Model-View 의존성 X - MVC패턴 MVC > MVP > MVVM
어디에 바인딩시켜줄지?
기능에따라 다르게된다

쿠팡
UserController(실시간 유저 데이터 - 장바구니, 포인트 등등)
실시간으로 바뀌기도하고, 로그인안해도 비로그인회원데이터 -> 로그인회원데이터
Stream을 통해 실시간으로 데이터를 받아오는형식
LocalController(기기에 SharedPreferences를 통해 저장한 데이터 불러올때)
ItemController(상품들에 대한 데이터)
메인화면 -> 메인화면에서 유저들이 상품들을 확인하니까 바인딩
DetailController(itemId) -> 데이터를 화면 구성
DetailScreen


GetXController를 binding(initializing)시키는방법

Get.put - put함수를 시행하는 코드 - binding 생성 후 연결
Get.lazyPut - 값을 사용할때가 아닌, 필요한 기능을 수행해야할때(함수를 수행할때) 필요할때 바인딩을 해준다
Get.putAsync - putAsync - 바인딩은 하지만, 비동기처리가 필요한 바인딩의경우
+ Get.find() 어떻게 세팅후 잘 사용하는지


Rx<User> user = User(name: 'haha',message: 'hello',age: 10).obs;
void addUserAge(){
    user.update((val) {
      val!.addAge();
    });
}
Rx타입-내장함수(update)








