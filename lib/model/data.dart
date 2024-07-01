import 'package:capstone_front/model/UserModel.dart';
import 'package:get/get.dart';

const categories = [
  {
    'name': '대구', 
    'items': [
      '칠곡 - 29석', 
      '서구 - 18석'
    ]
  },
  {
    'name': '구미', 
    'items': [
      'Carrot', 
      'Broccoli', 
      'Peas'
    ]
  },
  {
    'name': '안동', 
    'items': [
      'Dog', 
      'Cat', 
      'Bird'
    ]
  },
];

Rx<UserData> userdata = 
  UserData(
    id: '',pw: '', loginId: 'loginId',
    gradeClass: "0학년 0반", number: 0,phoneNumber: '010-////-////',  
    name: '홍길동', 
    roles: [], authorities: [], 
    timestamp: ''
  ).obs;