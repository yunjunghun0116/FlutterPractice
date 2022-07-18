import 'dart:convert';
/// status : "success"
/// message : "ok"
/// redirect : ""
/// data : {"content":[{"id":3,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"파라오2 브레인","shortDesc":"파라오 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://d1hx9iux3qv0op.cloudfront.net/img/4b7672b0-84fe-4a8b-8676-c5ada736caa6.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":true,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":3},{"id":28,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"엘리자베스","shortDesc":"엘리자베스","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":49500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/c28e17c7-4161-4525-8e4b-b1a6cc768361.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":1},{"id":29,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팰리스2 브레인","shortDesc":"팰리스2 브레인","price":5400000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":94500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/8cb69536-9548-4ad2-9aef-61bec118faec.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":43,"category":{"code":"1010","name":"안마의자","fullCategoryName":"바디프랜드>안마의자","imageUrl":null,"active":true},"name":"파라오2 COOL 브레인","shortDesc":"파라오 시리즈","price":6600000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":119500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/c762cb56-2b45-438e-8e4b-3047f86f5f3f.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":44,"category":{"code":"10","name":"바디프랜드","fullCategoryName":"바디프랜드","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/665b88e0-30e0-4c5a-8118-505d49cef239.png","active":true},"name":"파라오2 블랙에디션","shortDesc":"파라오 시리즈","price":6200000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":109500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/b4fbd550-b184-4c80-b531-8759e9c28377.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":45,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"파라오S2 브레인","shortDesc":"파라오 시리","price":7700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":139500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/be17a924-17f3-49fd-bb6f-bce4e1cbf5ae.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":46,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 COOL 브레인(쥬빌리실버)","shortDesc":"COOL 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/741aeca0-6d36-4cf8-8235-750086b9c740.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":47,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 COOL 브레인(보르도화이트)","shortDesc":"COOL 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/7d94d1e5-e0d1-4fca-a12c-1c9e76556aef.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":49,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"팬텀2 브레인 마블 스페셜(캡틴아메리카)","shortDesc":"마블 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/7e6002d6-9c88-4def-aff4-b0ae89385459.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":50,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"팬텀2 브레인 마블 스페셜(아이언맨)","shortDesc":"마블 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/1ac62af5-9c41-4b77-a7b4-d8a528c24208.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":51,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 브레인(쥬빌리실버)","shortDesc":"팬텀 시리즈","price":5000000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":89500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/59f71b1a-d7f3-42cb-838f-7e1dadffae69.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":52,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 브레인(보르도화이트)","shortDesc":"팬텀 시리즈","price":5000000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":89500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/599cc02a-f67b-4960-b224-afba2bfd88d2.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":53,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 브레인(카카오블랙)","shortDesc":"팬텀 시리즈","price":5000000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":89500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/9b48c091-6795-4373-93eb-b6b4f973c3b5.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":54,"category":{"code":"1010","name":"안마의자","fullCategoryName":"바디프랜드>안마의자","imageUrl":null,"active":true},"name":"팬텀메디컬","shortDesc":"의료기기","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/b156e1a8-9698-443b-8431-9036d8906623.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":56,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"벤타스 브레인","shortDesc":"벤타스 브레인","price":5000000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":89500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/49c420f2-54b2-4888-b8b5-3161327accf8.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":57,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"팰리스2코어","shortDesc":"코어 시리즈","price":4200000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":74500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/046c5c02-ca11-43bd-9e6f-06423436d58a.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":58,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"팬텀2코어(2021년형)","shortDesc":"코어 시리즈","price":4200000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":74500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/6db06b3a-c11f-4c98-a3be-515ebf27bda4.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":59,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"벤타스코어","shortDesc":"코어 시리즈","price":3400000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":64500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/c3d2567a-d252-4d23-bda4-8b9ef6d1eafb.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":60,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"레지나A2","shortDesc":"레지나A2","price":3800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":69500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/fbfc4611-199d-465b-9ef4-0209fb544488.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":61,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"셀레네2브레인","shortDesc":"셀레네2 브레인","price":3400000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":64500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/d1949d54-6bfe-4d3e-83e4-9a309fe30976.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":62,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"퍼스트레이디2","shortDesc":"퍼스트레이디2","price":3100000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":54500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/da5b4abc-40b0-49d3-9e8b-64b896ed6c74.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":63,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"엘리자베스플러스","shortDesc":"엘리자베스플러스","price":3100000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":54500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/a04172d3-9c2c-4c82-9590-6fea42597165.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":64,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"아제라플러스","shortDesc":"아제라플러스","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":49500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/3529e629-3fff-4e71-a6ea-57ccd9d494be.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":65,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"엘리제A","shortDesc":"엘리제A\n","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":49500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/f1fec9e6-16b8-4d7e-8fcb-022efc42de5a.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":66,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"엘리제","shortDesc":"엘리제\n","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":49500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/118efcdc-b601-42cd-acdc-d68871059506.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":67,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"아제라","shortDesc":"아제라","price":2300000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":39500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/004469a7-70f7-474f-b06e-593cc179078f.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":68,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"레그넘","shortDesc":"레그넘\n","price":2300000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":39500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/6c8677be-5d35-4fba-9bc1-4d430f15f2ed.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":69,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"코닉","shortDesc":"코닉","price":1900000,"reducePrice":null,"reducePercent":null,"rental":{"rental":false,"rentMonth":null,"rentPrice":null,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/4b67d219-1dff-4f35-be8c-b96400bc4b32.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":70,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"아제라에어","shortDesc":"아제라에어\n","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":false,"rentMonth":null,"rentPrice":null,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/7113925c-ab9b-43f2-a691-d8eb22f8a4bc.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":71,"category":{"code":"101060","name":"허그체어","fullCategoryName":"바디프랜드>안마의자>허그체어","imageUrl":null,"active":true},"name":"[허그체어 2.0] 아이언맨","shortDesc":"[허그체어 2.0] 아이언맨\n","price":1500000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":39,"rentPrice":39500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/c7c89c49-6238-4a87-9609-273662557a04.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":72,"category":{"code":"101060","name":"허그체어","fullCategoryName":"바디프랜드>안마의자>허그체어","imageUrl":null,"active":true},"name":"[허그체어 2.0] 캡틴아메리카","shortDesc":"[허그체어 2.0] 캡틴아메리카\n","price":1500000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":39,"rentPrice":39500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/63b81b2b-2209-46e0-aa71-1b3399dd2bc9.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":101,"category":{"code":"10","name":"바디프랜드","fullCategoryName":"바디프랜드","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/665b88e0-30e0-4c5a-8118-505d49cef239.png","active":true},"name":"[헉슬리] 핸드크림 트리오","shortDesc":"[헉슬리] 핸드크림 트리오","price":45000,"reducePrice":null,"reducePercent":null,"rental":{"rental":false,"rentMonth":null,"rentPrice":null,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/a6997e3d-c0c4-4c6c-9129-05fb8834b86f.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":105,"category":{"code":"1010","name":"안마의자","fullCategoryName":"바디프랜드>안마의자","imageUrl":null,"active":true},"name":"[친구초대 사은품] 안마의자 (팬텀2브레인 또는 팬텀메디컬)","shortDesc":"친구초대 10회 누적시 사은품 (선택가능)\n단, 팬텀2 브레인 선택시 색상 랜덤","price":null,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":0,"rentPrice":0,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/5da02462-1cf6-45ed-9031-daaa96ca81d7.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":true,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":143,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"더파라오","shortDesc":"더파라오","price":6200000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":109500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/d835033c-7fdb-4435-9bb8-d76a978d2f93.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":"","bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":144,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"더팬텀","shortDesc":"더팬텀","price":5400000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":94500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/9de17f55-5413-44fc-a25a-0151923451d6.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":"","bannerActive":false,"active":true,"stocks":999,"salesCount":0}],"pageable":{"sort":{"sorted":true,"unsorted":false,"empty":false},"pageNumber":0,"pageSize":40,"offset":0,"unpaged":false,"paged":true},"last":true,"totalPages":1,"totalElements":35,"sort":{"sorted":true,"unsorted":false,"empty":false},"first":true,"numberOfElements":35,"size":40,"number":0,"empty":false}

ShoppingListModel shoppingListModelFromJson(String str) => ShoppingListModel.fromJson(json.decode(str));
String shoppingListModelToJson(ShoppingListModel data) => json.encode(data.toJson());
class ShoppingListModel {
  ShoppingListModel({
      String? status, 
      String? message, 
      String? redirect, 
      ShoppingListData? data,}){
    _status = status;
    _message = message;
    _redirect = redirect;
    _data = data;
}

  ShoppingListModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _redirect = json['redirect'];
    _data = json['data'] != null ? ShoppingListData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  String? _redirect;
  ShoppingListData? _data;
ShoppingListModel copyWith({  String? status,
  String? message,
  String? redirect,
  ShoppingListData? data,
}) => ShoppingListModel(  status: status ?? _status,
  message: message ?? _message,
  redirect: redirect ?? _redirect,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  String? get redirect => _redirect;
  ShoppingListData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['redirect'] = _redirect;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// content : [{"id":3,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"파라오2 브레인","shortDesc":"파라오 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://d1hx9iux3qv0op.cloudfront.net/img/4b7672b0-84fe-4a8b-8676-c5ada736caa6.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":true,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":3},{"id":28,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"엘리자베스","shortDesc":"엘리자베스","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":49500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/c28e17c7-4161-4525-8e4b-b1a6cc768361.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":1},{"id":29,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팰리스2 브레인","shortDesc":"팰리스2 브레인","price":5400000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":94500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/8cb69536-9548-4ad2-9aef-61bec118faec.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":43,"category":{"code":"1010","name":"안마의자","fullCategoryName":"바디프랜드>안마의자","imageUrl":null,"active":true},"name":"파라오2 COOL 브레인","shortDesc":"파라오 시리즈","price":6600000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":119500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/c762cb56-2b45-438e-8e4b-3047f86f5f3f.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":44,"category":{"code":"10","name":"바디프랜드","fullCategoryName":"바디프랜드","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/665b88e0-30e0-4c5a-8118-505d49cef239.png","active":true},"name":"파라오2 블랙에디션","shortDesc":"파라오 시리즈","price":6200000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":109500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/b4fbd550-b184-4c80-b531-8759e9c28377.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":45,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"파라오S2 브레인","shortDesc":"파라오 시리","price":7700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":139500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/be17a924-17f3-49fd-bb6f-bce4e1cbf5ae.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":46,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 COOL 브레인(쥬빌리실버)","shortDesc":"COOL 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/741aeca0-6d36-4cf8-8235-750086b9c740.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":47,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 COOL 브레인(보르도화이트)","shortDesc":"COOL 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/7d94d1e5-e0d1-4fca-a12c-1c9e76556aef.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":49,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"팬텀2 브레인 마블 스페셜(캡틴아메리카)","shortDesc":"마블 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/7e6002d6-9c88-4def-aff4-b0ae89385459.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":50,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"팬텀2 브레인 마블 스페셜(아이언맨)","shortDesc":"마블 시리즈","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/1ac62af5-9c41-4b77-a7b4-d8a528c24208.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":51,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 브레인(쥬빌리실버)","shortDesc":"팬텀 시리즈","price":5000000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":89500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/59f71b1a-d7f3-42cb-838f-7e1dadffae69.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":52,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 브레인(보르도화이트)","shortDesc":"팬텀 시리즈","price":5000000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":89500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/599cc02a-f67b-4960-b224-afba2bfd88d2.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":53,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"팬텀2 브레인(카카오블랙)","shortDesc":"팬텀 시리즈","price":5000000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":89500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/9b48c091-6795-4373-93eb-b6b4f973c3b5.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":54,"category":{"code":"1010","name":"안마의자","fullCategoryName":"바디프랜드>안마의자","imageUrl":null,"active":true},"name":"팬텀메디컬","shortDesc":"의료기기","price":5800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/b156e1a8-9698-443b-8431-9036d8906623.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":56,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"벤타스 브레인","shortDesc":"벤타스 브레인","price":5000000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":89500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/49c420f2-54b2-4888-b8b5-3161327accf8.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":57,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"팰리스2코어","shortDesc":"코어 시리즈","price":4200000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":74500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/046c5c02-ca11-43bd-9e6f-06423436d58a.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":58,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"팬텀2코어(2021년형)","shortDesc":"코어 시리즈","price":4200000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":74500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/6db06b3a-c11f-4c98-a3be-515ebf27bda4.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":59,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"벤타스코어","shortDesc":"코어 시리즈","price":3400000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":64500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/c3d2567a-d252-4d23-bda4-8b9ef6d1eafb.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":60,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"레지나A2","shortDesc":"레지나A2","price":3800000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":69500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/fbfc4611-199d-465b-9ef4-0209fb544488.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":61,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"셀레네2브레인","shortDesc":"셀레네2 브레인","price":3400000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":64500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/d1949d54-6bfe-4d3e-83e4-9a309fe30976.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":62,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"퍼스트레이디2","shortDesc":"퍼스트레이디2","price":3100000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":54500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/da5b4abc-40b0-49d3-9e8b-64b896ed6c74.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":63,"category":{"code":"101030","name":"Premium","fullCategoryName":"바디프랜드>안마의자>Premium","imageUrl":null,"active":true},"name":"엘리자베스플러스","shortDesc":"엘리자베스플러스","price":3100000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":54500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/a04172d3-9c2c-4c82-9590-6fea42597165.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":64,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"아제라플러스","shortDesc":"아제라플러스","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":49500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/3529e629-3fff-4e71-a6ea-57ccd9d494be.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":65,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"엘리제A","shortDesc":"엘리제A\n","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":49500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/f1fec9e6-16b8-4d7e-8fcb-022efc42de5a.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":66,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"엘리제","shortDesc":"엘리제\n","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":49500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/118efcdc-b601-42cd-acdc-d68871059506.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":67,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"아제라","shortDesc":"아제라","price":2300000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":39500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/004469a7-70f7-474f-b06e-593cc179078f.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":68,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"레그넘","shortDesc":"레그넘\n","price":2300000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":39500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/6c8677be-5d35-4fba-9bc1-4d430f15f2ed.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":69,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"코닉","shortDesc":"코닉","price":1900000,"reducePrice":null,"reducePercent":null,"rental":{"rental":false,"rentMonth":null,"rentPrice":null,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/4b67d219-1dff-4f35-be8c-b96400bc4b32.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":70,"category":{"code":"101040","name":"Economy","fullCategoryName":"바디프랜드>안마의자>Economy","imageUrl":null,"active":true},"name":"아제라에어","shortDesc":"아제라에어\n","price":2700000,"reducePrice":null,"reducePercent":null,"rental":{"rental":false,"rentMonth":null,"rentPrice":null,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/7113925c-ab9b-43f2-a691-d8eb22f8a4bc.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":71,"category":{"code":"101060","name":"허그체어","fullCategoryName":"바디프랜드>안마의자>허그체어","imageUrl":null,"active":true},"name":"[허그체어 2.0] 아이언맨","shortDesc":"[허그체어 2.0] 아이언맨\n","price":1500000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":39,"rentPrice":39500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/c7c89c49-6238-4a87-9609-273662557a04.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":72,"category":{"code":"101060","name":"허그체어","fullCategoryName":"바디프랜드>안마의자>허그체어","imageUrl":null,"active":true},"name":"[허그체어 2.0] 캡틴아메리카","shortDesc":"[허그체어 2.0] 캡틴아메리카\n","price":1500000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":39,"rentPrice":39500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/63b81b2b-2209-46e0-aa71-1b3399dd2bc9.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":101,"category":{"code":"10","name":"바디프랜드","fullCategoryName":"바디프랜드","imageUrl":"https://d1hx9iux3qv0op.cloudfront.net/img/665b88e0-30e0-4c5a-8118-505d49cef239.png","active":true},"name":"[헉슬리] 핸드크림 트리오","shortDesc":"[헉슬리] 핸드크림 트리오","price":45000,"reducePrice":null,"reducePercent":null,"rental":{"rental":false,"rentMonth":null,"rentPrice":null,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/a6997e3d-c0c4-4c6c-9129-05fb8834b86f.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":105,"category":{"code":"1010","name":"안마의자","fullCategoryName":"바디프랜드>안마의자","imageUrl":null,"active":true},"name":"[친구초대 사은품] 안마의자 (팬텀2브레인 또는 팬텀메디컬)","shortDesc":"친구초대 10회 누적시 사은품 (선택가능)\n단, 팬텀2 브레인 선택시 색상 랜덤","price":null,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":0,"rentPrice":0,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/5da02462-1cf6-45ed-9031-daaa96ca81d7.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":true,"bannerImage":null,"bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":143,"category":{"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true},"name":"더파라오","shortDesc":"더파라오","price":6200000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":109500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/d835033c-7fdb-4435-9bb8-d76a978d2f93.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":"","bannerActive":false,"active":true,"stocks":999,"salesCount":0},{"id":144,"category":{"code":"101020","name":"Prestige","fullCategoryName":"바디프랜드>안마의자>Prestige","imageUrl":null,"active":true},"name":"더팬텀","shortDesc":"더팬텀","price":5400000,"reducePrice":null,"reducePercent":null,"rental":{"rental":true,"rentMonth":59,"rentPrice":94500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null},"rentPrice":0,"reduceRentalPrice":0,"reduceRentalPercent":null,"listImage":"https://du3kkzispvlyx.cloudfront.net/img/9de17f55-5413-44fc-a25a-0151923451d6.jpg","soldout":false,"hotDeal":{"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null},"buyTogether":{"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null},"pointMallGoods":false,"recommendable":false,"bannerImage":"","bannerActive":false,"active":true,"stocks":999,"salesCount":0}]
/// pageable : {"sort":{"sorted":true,"unsorted":false,"empty":false},"pageNumber":0,"pageSize":40,"offset":0,"unpaged":false,"paged":true}
/// last : true
/// totalPages : 1
/// totalElements : 35
/// sort : {"sorted":true,"unsorted":false,"empty":false}
/// first : true
/// numberOfElements : 35
/// size : 40
/// number : 0
/// empty : false

ShoppingListData dataFromJson(String str) => ShoppingListData.fromJson(json.decode(str));
String dataToJson(ShoppingListData data) => json.encode(data.toJson());
class ShoppingListData {
  ShoppingListData({
      List<Content>? content, 
      Pageable? pageable, 
      bool? last, 
      int? totalPages, 
      int? totalElements, 
      Sort? sort,
      bool? first, 
      int? numberOfElements, 
      int? size, 
      int? number, 
      bool? empty,}){
    _content = content;
    _pageable = pageable;
    _last = last;
    _totalPages = totalPages;
    _totalElements = totalElements;
    _sort = sort;
    _first = first;
    _numberOfElements = numberOfElements;
    _size = size;
    _number = number;
    _empty = empty;
}

  ShoppingListData.fromJson(dynamic json) {
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(Content.fromJson(v));
      });
    }
    _pageable = json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    _last = json['last'];
    _totalPages = json['totalPages'];
    _totalElements = json['totalElements'];
    _sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    _first = json['first'];
    _numberOfElements = json['numberOfElements'];
    _size = json['size'];
    _number = json['number'];
    _empty = json['empty'];
  }
  List<Content>? _content;
  Pageable? _pageable;
  bool? _last;
  int? _totalPages;
  int? _totalElements;
  Sort? _sort;
  bool? _first;
  int? _numberOfElements;
  int? _size;
  int? _number;
  bool? _empty;
ShoppingListData copyWith({  List<Content>? content,
  Pageable? pageable,
  bool? last,
  int? totalPages,
  int? totalElements,
  Sort? sort,
  bool? first,
  int? numberOfElements,
  int? size,
  int? number,
  bool? empty,
}) => ShoppingListData(  content: content ?? _content,
  pageable: pageable ?? _pageable,
  last: last ?? _last,
  totalPages: totalPages ?? _totalPages,
  totalElements: totalElements ?? _totalElements,
  sort: sort ?? _sort,
  first: first ?? _first,
  numberOfElements: numberOfElements ?? _numberOfElements,
  size: size ?? _size,
  number: number ?? _number,
  empty: empty ?? _empty,
);
  List<Content>? get content => _content;
  Pageable? get pageable => _pageable;
  bool? get last => _last;
  int? get totalPages => _totalPages;
  int? get totalElements => _totalElements;
  Sort? get sort => _sort;
  bool? get first => _first;
  int? get numberOfElements => _numberOfElements;
  int? get size => _size;
  int? get number => _number;
  bool? get empty => _empty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_content != null) {
      map['content'] = _content?.map((v) => v.toJson()).toList();
    }
    if (_pageable != null) {
      map['pageable'] = _pageable?.toJson();
    }
    map['last'] = _last;
    map['totalPages'] = _totalPages;
    map['totalElements'] = _totalElements;
    if (_sort != null) {
      map['sort'] = _sort?.toJson();
    }
    map['first'] = _first;
    map['numberOfElements'] = _numberOfElements;
    map['size'] = _size;
    map['number'] = _number;
    map['empty'] = _empty;
    return map;
  }

}

/// sorted : true
/// unsorted : false
/// empty : false

Sort sortFromJson(String str) => Sort.fromJson(json.decode(str));
String sortToJson(Sort data) => json.encode(data.toJson());
class Sort {
  Sort({
      bool? sorted, 
      bool? unsorted, 
      bool? empty,}){
    _sorted = sorted;
    _unsorted = unsorted;
    _empty = empty;
}

  Sort.fromJson(dynamic json) {
    _sorted = json['sorted'];
    _unsorted = json['unsorted'];
    _empty = json['empty'];
  }
  bool? _sorted;
  bool? _unsorted;
  bool? _empty;
Sort copyWith({  bool? sorted,
  bool? unsorted,
  bool? empty,
}) => Sort(  sorted: sorted ?? _sorted,
  unsorted: unsorted ?? _unsorted,
  empty: empty ?? _empty,
);
  bool? get sorted => _sorted;
  bool? get unsorted => _unsorted;
  bool? get empty => _empty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sorted'] = _sorted;
    map['unsorted'] = _unsorted;
    map['empty'] = _empty;
    return map;
  }

}

/// sort : {"sorted":true,"unsorted":false,"empty":false}
/// pageNumber : 0
/// pageSize : 40
/// offset : 0
/// unpaged : false
/// paged : true

Pageable pageableFromJson(String str) => Pageable.fromJson(json.decode(str));
String pageableToJson(Pageable data) => json.encode(data.toJson());
class Pageable {
  Pageable({
      Sort? sort,
      int? pageNumber, 
      int? pageSize, 
      int? offset, 
      bool? unpaged, 
      bool? paged,}){
    _sort = sort;
    _pageNumber = pageNumber;
    _pageSize = pageSize;
    _offset = offset;
    _unpaged = unpaged;
    _paged = paged;
}

  Pageable.fromJson(dynamic json) {
    _sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    _pageNumber = json['pageNumber'];
    _pageSize = json['pageSize'];
    _offset = json['offset'];
    _unpaged = json['unpaged'];
    _paged = json['paged'];
  }
  Sort? _sort;
  int? _pageNumber;
  int? _pageSize;
  int? _offset;
  bool? _unpaged;
  bool? _paged;
Pageable copyWith({Sort? sort,
  int? pageNumber,
  int? pageSize,
  int? offset,
  bool? unpaged,
  bool? paged,
}) => Pageable(  sort: sort ?? _sort,
  pageNumber: pageNumber ?? _pageNumber,
  pageSize: pageSize ?? _pageSize,
  offset: offset ?? _offset,
  unpaged: unpaged ?? _unpaged,
  paged: paged ?? _paged,
);
  Sort? get sort => _sort;
  int? get pageNumber => _pageNumber;
  int? get pageSize => _pageSize;
  int? get offset => _offset;
  bool? get unpaged => _unpaged;
  bool? get paged => _paged;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sort != null) {
      map['sort'] = _sort?.toJson();
    }
    map['pageNumber'] = _pageNumber;
    map['pageSize'] = _pageSize;
    map['offset'] = _offset;
    map['unpaged'] = _unpaged;
    map['paged'] = _paged;
    return map;
  }

}
/// id : 3
/// category : {"code":"101010","name":"Luxury","fullCategoryName":"바디프랜드>안마의자>Luxury","imageUrl":null,"active":true}
/// name : "파라오2 브레인"
/// shortDesc : "파라오 시리즈"
/// price : 5800000
/// reducePrice : null
/// reducePercent : null
/// rental : {"rental":true,"rentMonth":59,"rentPrice":99500,"reduceRentPrice":null,"reduceRentPercent":null,"optionItems":null}
/// rentPrice : 0
/// reduceRentalPrice : 0
/// reduceRentalPercent : null
/// listImage : "https://d1hx9iux3qv0op.cloudfront.net/img/4b7672b0-84fe-4a8b-8676-c5ada736caa6.jpg"
/// soldout : false
/// hotDeal : {"hotDeal":false,"hotDealDiscountRatio":null,"hotDealUntil":null,"hotDealSoldCount":null,"hotDealTotalLimit":null}
/// buyTogether : {"buyTogether":false,"buyTogetherSoldCount":null,"buyTogetherTotalLimit":null}
/// pointMallGoods : false
/// recommendable : true
/// bannerImage : null
/// bannerActive : false
/// active : true
/// stocks : 999
/// salesCount : 3

Content contentFromJson(String str) => Content.fromJson(json.decode(str));
String contentToJson(Content data) => json.encode(data.toJson());
class Content {
  Content({
      int? id, 
      CategoryList? category,
      String? name, 
      String? shortDesc, 
      int? price, 
      dynamic reducePrice, 
      dynamic reducePercent, 
      Rental? rental, 
      int? rentPrice, 
      int? reduceRentalPrice, 
      dynamic reduceRentalPercent, 
      String? listImage, 
      bool? soldout, 
      HotDeal? hotDeal, 
      BuyTogether? buyTogether, 
      bool? pointMallGoods, 
      bool? recommendable, 
      dynamic bannerImage, 
      bool? bannerActive, 
      bool? active, 
      int? stocks, 
      int? salesCount,}){
    _id = id;
    _category = category;
    _name = name;
    _shortDesc = shortDesc;
    _price = price;
    _reducePrice = reducePrice;
    _reducePercent = reducePercent;
    _rental = rental;
    _rentPrice = rentPrice;
    _reduceRentalPrice = reduceRentalPrice;
    _reduceRentalPercent = reduceRentalPercent;
    _listImage = listImage;
    _soldout = soldout;
    _hotDeal = hotDeal;
    _buyTogether = buyTogether;
    _pointMallGoods = pointMallGoods;
    _recommendable = recommendable;
    _bannerImage = bannerImage;
    _bannerActive = bannerActive;
    _active = active;
    _stocks = stocks;
    _salesCount = salesCount;
}

  Content.fromJson(dynamic json) {
    _id = json['id'];
    _category = json['category'] != null ? CategoryList.fromJson(json['category']) : null;
    _name = json['name'];
    _shortDesc = json['shortDesc'];
    _price = json['price'];
    _reducePrice = json['reducePrice'];
    _reducePercent = json['reducePercent'];
    _rental = json['rental'] != null ? Rental.fromJson(json['rental']) : null;
    _rentPrice = json['rentPrice'];
    _reduceRentalPrice = json['reduceRentalPrice'];
    _reduceRentalPercent = json['reduceRentalPercent'];
    _listImage = json['listImage'];
    _soldout = json['soldout'];
    _hotDeal = json['hotDeal'] != null ? HotDeal.fromJson(json['hotDeal']) : null;
    _buyTogether = json['buyTogether'] != null ? BuyTogether.fromJson(json['buyTogether']) : null;
    _pointMallGoods = json['pointMallGoods'];
    _recommendable = json['recommendable'];
    _bannerImage = json['bannerImage'];
    _bannerActive = json['bannerActive'];
    _active = json['active'];
    _stocks = json['stocks'];
    _salesCount = json['salesCount'];
  }
  int? _id;
  CategoryList? _category;
  String? _name;
  String? _shortDesc;
  int? _price;
  dynamic _reducePrice;
  dynamic _reducePercent;
  Rental? _rental;
  int? _rentPrice;
  int? _reduceRentalPrice;
  dynamic _reduceRentalPercent;
  String? _listImage;
  bool? _soldout;
  HotDeal? _hotDeal;
  BuyTogether? _buyTogether;
  bool? _pointMallGoods;
  bool? _recommendable;
  dynamic _bannerImage;
  bool? _bannerActive;
  bool? _active;
  int? _stocks;
  int? _salesCount;
Content copyWith({  int? id,
  CategoryList? category,
  String? name,
  String? shortDesc,
  int? price,
  dynamic reducePrice,
  dynamic reducePercent,
  Rental? rental,
  int? rentPrice,
  int? reduceRentalPrice,
  dynamic reduceRentalPercent,
  String? listImage,
  bool? soldout,
  HotDeal? hotDeal,
  BuyTogether? buyTogether,
  bool? pointMallGoods,
  bool? recommendable,
  dynamic bannerImage,
  bool? bannerActive,
  bool? active,
  int? stocks,
  int? salesCount,
}) => Content(  id: id ?? _id,
  category: category ?? _category,
  name: name ?? _name,
  shortDesc: shortDesc ?? _shortDesc,
  price: price ?? _price,
  reducePrice: reducePrice ?? _reducePrice,
  reducePercent: reducePercent ?? _reducePercent,
  rental: rental ?? _rental,
  rentPrice: rentPrice ?? _rentPrice,
  reduceRentalPrice: reduceRentalPrice ?? _reduceRentalPrice,
  reduceRentalPercent: reduceRentalPercent ?? _reduceRentalPercent,
  listImage: listImage ?? _listImage,
  soldout: soldout ?? _soldout,
  hotDeal: hotDeal ?? _hotDeal,
  buyTogether: buyTogether ?? _buyTogether,
  pointMallGoods: pointMallGoods ?? _pointMallGoods,
  recommendable: recommendable ?? _recommendable,
  bannerImage: bannerImage ?? _bannerImage,
  bannerActive: bannerActive ?? _bannerActive,
  active: active ?? _active,
  stocks: stocks ?? _stocks,
  salesCount: salesCount ?? _salesCount,
);
  int? get id => _id;
  CategoryList? get category => _category;
  String? get name => _name;
  String? get shortDesc => _shortDesc;
  int? get price => _price;
  dynamic get reducePrice => _reducePrice;
  dynamic get reducePercent => _reducePercent;
  Rental? get rental => _rental;
  int? get rentPrice => _rentPrice;
  int? get reduceRentalPrice => _reduceRentalPrice;
  dynamic get reduceRentalPercent => _reduceRentalPercent;
  String? get listImage => _listImage;
  bool? get soldout => _soldout;
  HotDeal? get hotDeal => _hotDeal;
  BuyTogether? get buyTogether => _buyTogether;
  bool? get pointMallGoods => _pointMallGoods;
  bool? get recommendable => _recommendable;
  dynamic get bannerImage => _bannerImage;
  bool? get bannerActive => _bannerActive;
  bool? get active => _active;
  int? get stocks => _stocks;
  int? get salesCount => _salesCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['name'] = _name;
    map['shortDesc'] = _shortDesc;
    map['price'] = _price;
    map['reducePrice'] = _reducePrice;
    map['reducePercent'] = _reducePercent;
    if (_rental != null) {
      map['rental'] = _rental?.toJson();
    }
    map['rentPrice'] = _rentPrice;
    map['reduceRentalPrice'] = _reduceRentalPrice;
    map['reduceRentalPercent'] = _reduceRentalPercent;
    map['listImage'] = _listImage;
    map['soldout'] = _soldout;
    if (_hotDeal != null) {
      map['hotDeal'] = _hotDeal?.toJson();
    }
    if (_buyTogether != null) {
      map['buyTogether'] = _buyTogether?.toJson();
    }
    map['pointMallGoods'] = _pointMallGoods;
    map['recommendable'] = _recommendable;
    map['bannerImage'] = _bannerImage;
    map['bannerActive'] = _bannerActive;
    map['active'] = _active;
    map['stocks'] = _stocks;
    map['salesCount'] = _salesCount;
    return map;
  }

}

/// buyTogether : false
/// buyTogetherSoldCount : null
/// buyTogetherTotalLimit : null

BuyTogether buyTogetherFromJson(String str) => BuyTogether.fromJson(json.decode(str));
String buyTogetherToJson(BuyTogether data) => json.encode(data.toJson());
class BuyTogether {
  BuyTogether({
      bool? buyTogether, 
      dynamic buyTogetherSoldCount, 
      dynamic buyTogetherTotalLimit,}){
    _buyTogether = buyTogether;
    _buyTogetherSoldCount = buyTogetherSoldCount;
    _buyTogetherTotalLimit = buyTogetherTotalLimit;
}

  BuyTogether.fromJson(dynamic json) {
    _buyTogether = json['buyTogether'];
    _buyTogetherSoldCount = json['buyTogetherSoldCount'];
    _buyTogetherTotalLimit = json['buyTogetherTotalLimit'];
  }
  bool? _buyTogether;
  dynamic _buyTogetherSoldCount;
  dynamic _buyTogetherTotalLimit;
BuyTogether copyWith({  bool? buyTogether,
  dynamic buyTogetherSoldCount,
  dynamic buyTogetherTotalLimit,
}) => BuyTogether(  buyTogether: buyTogether ?? _buyTogether,
  buyTogetherSoldCount: buyTogetherSoldCount ?? _buyTogetherSoldCount,
  buyTogetherTotalLimit: buyTogetherTotalLimit ?? _buyTogetherTotalLimit,
);
  bool? get buyTogether => _buyTogether;
  dynamic get buyTogetherSoldCount => _buyTogetherSoldCount;
  dynamic get buyTogetherTotalLimit => _buyTogetherTotalLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['buyTogether'] = _buyTogether;
    map['buyTogetherSoldCount'] = _buyTogetherSoldCount;
    map['buyTogetherTotalLimit'] = _buyTogetherTotalLimit;
    return map;
  }

}

/// hotDeal : false
/// hotDealDiscountRatio : null
/// hotDealUntil : null
/// hotDealSoldCount : null
/// hotDealTotalLimit : null

HotDeal hotDealFromJson(String str) => HotDeal.fromJson(json.decode(str));
String hotDealToJson(HotDeal data) => json.encode(data.toJson());
class HotDeal {
  HotDeal({
      bool? hotDeal, 
      dynamic hotDealDiscountRatio, 
      dynamic hotDealUntil, 
      dynamic hotDealSoldCount, 
      dynamic hotDealTotalLimit,}){
    _hotDeal = hotDeal;
    _hotDealDiscountRatio = hotDealDiscountRatio;
    _hotDealUntil = hotDealUntil;
    _hotDealSoldCount = hotDealSoldCount;
    _hotDealTotalLimit = hotDealTotalLimit;
}

  HotDeal.fromJson(dynamic json) {
    _hotDeal = json['hotDeal'];
    _hotDealDiscountRatio = json['hotDealDiscountRatio'];
    _hotDealUntil = json['hotDealUntil'];
    _hotDealSoldCount = json['hotDealSoldCount'];
    _hotDealTotalLimit = json['hotDealTotalLimit'];
  }
  bool? _hotDeal;
  dynamic _hotDealDiscountRatio;
  dynamic _hotDealUntil;
  dynamic _hotDealSoldCount;
  dynamic _hotDealTotalLimit;
HotDeal copyWith({  bool? hotDeal,
  dynamic hotDealDiscountRatio,
  dynamic hotDealUntil,
  dynamic hotDealSoldCount,
  dynamic hotDealTotalLimit,
}) => HotDeal(  hotDeal: hotDeal ?? _hotDeal,
  hotDealDiscountRatio: hotDealDiscountRatio ?? _hotDealDiscountRatio,
  hotDealUntil: hotDealUntil ?? _hotDealUntil,
  hotDealSoldCount: hotDealSoldCount ?? _hotDealSoldCount,
  hotDealTotalLimit: hotDealTotalLimit ?? _hotDealTotalLimit,
);
  bool? get hotDeal => _hotDeal;
  dynamic get hotDealDiscountRatio => _hotDealDiscountRatio;
  dynamic get hotDealUntil => _hotDealUntil;
  dynamic get hotDealSoldCount => _hotDealSoldCount;
  dynamic get hotDealTotalLimit => _hotDealTotalLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hotDeal'] = _hotDeal;
    map['hotDealDiscountRatio'] = _hotDealDiscountRatio;
    map['hotDealUntil'] = _hotDealUntil;
    map['hotDealSoldCount'] = _hotDealSoldCount;
    map['hotDealTotalLimit'] = _hotDealTotalLimit;
    return map;
  }

}

/// rental : true
/// rentMonth : 59
/// rentPrice : 99500
/// reduceRentPrice : null
/// reduceRentPercent : null
/// optionItems : null

Rental rentalFromJson(String str) => Rental.fromJson(json.decode(str));
String rentalToJson(Rental data) => json.encode(data.toJson());
class Rental {
  Rental({
      bool? rental, 
      int? rentMonth, 
      int? rentPrice, 
      dynamic reduceRentPrice, 
      dynamic reduceRentPercent, 
      dynamic optionItems,}){
    _rental = rental;
    _rentMonth = rentMonth;
    _rentPrice = rentPrice;
    _reduceRentPrice = reduceRentPrice;
    _reduceRentPercent = reduceRentPercent;
    _optionItems = optionItems;
}

  Rental.fromJson(dynamic json) {
    _rental = json['rental'];
    _rentMonth = json['rentMonth'];
    _rentPrice = json['rentPrice'];
    _reduceRentPrice = json['reduceRentPrice'];
    _reduceRentPercent = json['reduceRentPercent'];
    _optionItems = json['optionItems'];
  }
  bool? _rental;
  int? _rentMonth;
  int? _rentPrice;
  dynamic _reduceRentPrice;
  dynamic _reduceRentPercent;
  dynamic _optionItems;
Rental copyWith({  bool? rental,
  int? rentMonth,
  int? rentPrice,
  dynamic reduceRentPrice,
  dynamic reduceRentPercent,
  dynamic optionItems,
}) => Rental(  rental: rental ?? _rental,
  rentMonth: rentMonth ?? _rentMonth,
  rentPrice: rentPrice ?? _rentPrice,
  reduceRentPrice: reduceRentPrice ?? _reduceRentPrice,
  reduceRentPercent: reduceRentPercent ?? _reduceRentPercent,
  optionItems: optionItems ?? _optionItems,
);
  bool? get rental => _rental;
  int? get rentMonth => _rentMonth;
  int? get rentPrice => _rentPrice;
  dynamic get reduceRentPrice => _reduceRentPrice;
  dynamic get reduceRentPercent => _reduceRentPercent;
  dynamic get optionItems => _optionItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rental'] = _rental;
    map['rentMonth'] = _rentMonth;
    map['rentPrice'] = _rentPrice;
    map['reduceRentPrice'] = _reduceRentPrice;
    map['reduceRentPercent'] = _reduceRentPercent;
    map['optionItems'] = _optionItems;
    return map;
  }

}

/// code : "101010"
/// name : "Luxury"
/// fullCategoryName : "바디프랜드>안마의자>Luxury"
/// imageUrl : null
/// active : true

CategoryList categoryFromJson(String str) => CategoryList.fromJson(json.decode(str));
String categoryToJson(CategoryList data) => json.encode(data.toJson());
class CategoryList {
  CategoryList({
      String? code, 
      String? name, 
      String? fullCategoryName, 
      dynamic imageUrl, 
      bool? active,}){
    _code = code;
    _name = name;
    _fullCategoryName = fullCategoryName;
    _imageUrl = imageUrl;
    _active = active;
}

  CategoryList.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _fullCategoryName = json['fullCategoryName'];
    _imageUrl = json['imageUrl'];
    _active = json['active'];
  }
  String? _code;
  String? _name;
  String? _fullCategoryName;
  dynamic _imageUrl;
  bool? _active;
CategoryList copyWith({  String? code,
  String? name,
  String? fullCategoryName,
  dynamic imageUrl,
  bool? active,
}) => CategoryList(  code: code ?? _code,
  name: name ?? _name,
  fullCategoryName: fullCategoryName ?? _fullCategoryName,
  imageUrl: imageUrl ?? _imageUrl,
  active: active ?? _active,
);
  String? get code => _code;
  String? get name => _name;
  String? get fullCategoryName => _fullCategoryName;
  dynamic get imageUrl => _imageUrl;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['fullCategoryName'] = _fullCategoryName;
    map['imageUrl'] = _imageUrl;
    map['active'] = _active;
    return map;
  }

}