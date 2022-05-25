# bodyfriend_clone


SingleChildScrollView : 모든 컴포넌트를 렌더링
ListView : 보여지는 컴포넌트들을 렌더링

-> 속도차이


map : 위젯을 빌드하는 부분에서 주로 사용
forEach : 함수를 작성하는 부분에서 주로 사용
List 의 크기가 5일경우 ->

map((내부 원소){
    원소를 가공하는 부분
    return 가공된 원소;
}).toList => Column,Row

1. 필요한 데이터를 참조
2. 참조한 데이터를 바탕으로 위젯을(각각의 컴포넌트)그린다

비동기처리 async 와 주로 엮여서 사용
함수의 순차처리를 위해 필요한 함수(then) 콜백함수 결과가 다음함수의 args로 들어간다
A라는 함수의 return a
B라는 함수의 return b
Chair List를 받아오는 함수A -> ChairList 를 가지고 해야하는 함수B
A.then(B(res))

A.then(B(a)).then(()=>)

발생한 에러
맨처음 참조한 chairList = [];
update();
A Screen
B Screen
C Screen

모바일 <-> 서버
넘겨줄때,받을때 둘다 가리킴
1) FutureBuilder-future요청중 -> 데이터 없는상태
2) 데이터를 서버로부터 받았을때 200 404 400 401  snapshot(X) -> 새로운 snapshot으로 업데이트

ListView , SingleChildScrollView+Column/Row
카테고리 : 10개, 각각 이미지
이미지 100만 -> 유저가 보는 이미지 : 2~3개 장점 : 메모리의 효율 더 올릴수있고, 속도가 빠르다
1) ListView -> 화면에 보여지는 부분만 렌더링
2) SingleChildScrollView -> children에 속한 위젯들을 모두 렌더링


Web(JavaScript) <-> App(Dart)
WebView -> JavaScript코드 -> 화면 제작
        -> 주소를 통해 -> 화면 제작

함수호출 -> JavaScript코드 수행 -> name onMessageReceived
JS
window.채널이름(name).postMessage(var value)

name -> message



MVC -> Model View Controller + Service

View -> Controller -> Service -> Repository/Server요청

        Model(프로젝트 안에서 사용되는 객체의 정의) 여러곳에서도 올바르게 객체의 변수의 값에 접근할 수 있다
        Getter/Setter -> Map 전혀 사용 X
                      Model로써 객체가 만들어져있어야 해당 객체의 변수의 값에 접근 -> 게터세터방식
                      객체지향설계 / 객체지향프로그래밍


데이터 송수신 -> 데이터를 누락되거나 오류가 생기지 않도록 감싸주는 작업
Header-Body-Trailer
Header : 실제 데이터에대한 정보들 (실제 데이터정보의 길이/크기)
Body : 실제 데이터
Trailer : 오류에 대한 검증 작업들

Map -> 바로 내 기기로 넘어올수 없다! -> String/int/Map/Set/null -> Json 변환후에












flutter_datetime_picker -> 문제점 timePicker기능 혹은 일만 기록하기에 불편 -> 코드 분석후 직접 해당 라이브러리에 존재하는 기능을 구현해봄