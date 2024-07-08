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

Rx<User> USERDATA = 
  User(
    id: '', loginId: 'loginId',
    gradeClass: "0학년 0반", number: 0,phoneNumber: '010-0000-0000',  
    name: '홍길동', 
    roles: [], authorities: [], usingCk: true, boardingCk: false  
  ).obs;



const busDataSet = [
  {
    "busNumber": 4,
    "busName": "구미행(인동)",
    "titleCityName": "구미",
    "towns": [
      {
        "id": 1,
        "townName": "인동 ",
        "busVillages": [
          {
            "id": 1,
            "villageName": "천생초앞"
          },
          {
            "id": 2,
            "villageName": "인동육교"
          }
        ]
      },
      {
        "id": 2,
        "townName": "석적",
        "busVillages": [
          {
            "id": 3,
            "villageName": "3공단부영아파트"
          }
        ]
      },
    ]
  },
  {
    "busNumber": 1,
    "busName": "대구행(대구칠곡IC)",
    "titleCityName": "대구",
    "towns": [
      {
        "id": 1,
        "townName": "대구(칠곡)",
        "busVillages": [
          {
            "id": 1,
            "villageName": "대구칠곡IC"
          },
        ]
      },
      {
        "id": 2,
        "townName": "동구",
        "busVillages": [
          {
            "id": 1,
            "villageName": "동대구역"
          }
        ]
      }
    ]
  },
  {
    "busNumber": 2,
    "busName": "대구행(대구북부정류장)",
    "titleCityName": "대구",
    "towns": [
      {
        "id": 1,
        "townName": "서구",
        "busVillages": [
          {
            "id": 1,
            "villageName": "북부정류장앞"
          }
        ]
      },
      {
        "id": 2,
        "townName": "동구",
        "busVillages": [
          {
            "id": 1,
            "villageName": "동대구역"
          }
        ]
      }
    ]
  },
  
  {
    "busNumber": 3,
    "busName": "안동 방향",
    "titleCityName": "안동",
    "towns": [
      {
        "id": 1,
        "townName": "송현동",
        "busVillages": [
          {
            "id": 1,
            "villageName": "안동역(안동시외터미널)"
          },
        ]
      },
      {
        "id": 2,
        "townName": "옥동",
        "busVillages": [
          {
            "id": 1,
            "villageName": "옥동"
          }
        ]
      }
    ]
  },
  {
    "busNumber": 5,
    "busName": "구미행(옥계)",
    "titleCityName": "구미",
    "towns": [
      {
        "id": 1,
        "townName": "옥계동",
        "busVillages": [
          {
            "id": 1,
            "villageName": "옥계탑정영외과"
          },
        ]
      },
      {
        "id": 2,
        "townName": "원평동",
        "busVillages": [
          {
            "id": 1,
            "villageName": "구미시외버스터미널"
          },
          {
            "id": 2,
            "villageName": "구미역"
          }
        ]
      }
    ]
  },
];