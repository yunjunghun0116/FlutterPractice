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