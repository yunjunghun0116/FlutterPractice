# 애완동물의 순간들을 기록하는 앱

# 애완동물이 밥 준 시간을 기록하면 자체적으로 저장해놓은다음에
# 시간이 되면 알람으로 알려주고
# 사진을 올려놓아도 이를 기억하는데 이 기능은 다른 이미지주소를 저장해놓고 가져오는건 나중에 하는방식으로

## 아이들이 밥을 잘 먹으면 강아지 종류별로 간식추천시간을 정해주고,
## 건강관리를 추천해줌 - 나이에따라서

- [ ] model : pet_moment 모델 -> 강아지의 이미지와 date와 설명을 가지고있다
- [ ] controller : 애완동물의 정보(pet_controller)
- [ ] screens : 메인홈페이지(밥준시간 -> 밥먹을시간,사진들(grid형식의 singlechildscrollview)
- [ ] components : bottomsheet -> 밥준시간을 기록할 수 있도록


### 기능
- flutter_storage_secure : 로그인했는지 (이메일로 로그인하도록)
- shared_reference : 밥준시간을 여기에다 기록할것 -> 년/월/일/시 이렇게 4구간만 기록
- Hero : Homes 사진을 클릭할때마다 Details 이동하게 해줄때 이미지가 커지는 형식으로(이어지는느낌)
- Date : DateTime클래스를 이용할것이며, String을 기억했다가 parse(str)을 통해 가져오는 방식으로
