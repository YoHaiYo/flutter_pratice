//  2회차 강의 - 23.03.18

class Collections {
  // Collections의 타입에는 List, Map, Set 3가지가 있음.
  // List : 목록 -> 어떤 형태의 것들을 여러개 가지고 있는 것
  Collections() {
    // List -> String 타입을 여러개 가진 List

    // 기본 형태 설명

    // String = 타입
    // name = 변수명
    // "임미나" = 초기화
    String name = "임미나"; //이때 name을 여러개 가지고 싶을때 List 사용.

    // List<String> = 타입
    // nameList = 변수명
    // [] = 초기화 -> [] 콜렉션(여러개를 모아둔 것)
    List<String> nameList = ["임미나", "더조은컴퓨터학원"];
    print('Collections.Collections $nameList');


    // 코드정리 : Ctrl + Alt + L
    List<int> scoreList = [88, 62, 90, 100, 41];
    print('Collections.Collections $scoreList');

    listAdd();
    listRemove();
    sort();
    collectionMap();
    collectionSet();
  }

  void listAdd() {
    print(" ----------- list 추가하기 ----------- ");

    List<int> listInt = [1, 2, 3, 4, 5];
    print('Collections.listAdd 1 : $listInt');

    // list 추가하기
    // 1. add -> 1개 추가
    // 2. addAll -> 여러개 추가
    // 3. insert -> 수정. 수정을 하기 위해서는 몇번째값을 수정할지, 어떤 값으로 수정할지가 필요함.
    // Collection에서 중요한 것 : 순서가 0부터 시작한다.

    listInt.add(6);
    listInt.add(7);
    print('Collections.listAdd 2 : $listInt');

    listInt.addAll([1, 2, 3]);
    print('Collections.listAdd 3 : $listInt');

    //1번째 값을 50으로 바꾼다.
    listInt.insert(0, 50);
    print('Collections.listAdd 4 : $listInt');

    //3번째 값을 17으로 바꾼다.
    listInt.insert(2, 17);
    print('Collections.listAdd 5 : $listInt');
  }

  // 배열 제거
  // 1. removelast : 배열에서 마지막 값을 제거해줌.
  // 2. remove : 일치하는 값을 제거함
  // 3. removeAt : 몇번째 것을 지울 것인지
  // 4. clear : 전부 삭제

  void listRemove() {
    print(" ----------- list 제거 ----------- ");

    List<int> listInt = [1, 2, 3, 4, 5];
    print('Collections.listRemove : $listInt');

    // 배열의 값 읽기
    // 읽어오고 싶은 index 값을 넣어준다. index라는 것은 몇번쨰 인지(숫자값)
    // ListInt[1] : listInt 배열에서 두번째 값을 가져옵니다. 즉 2를 가져옴
    int first = listInt[1];
    print('Collections.listRemove 1 : $first');

    // removelast
    listInt.removeLast();
    print('Collections.listRemove 2 : $listInt');

    // removeAt
    listInt.removeAt(0);
    print('Collections.listRemove 3 : $listInt');

    // remove(3) : 3과 동일한 값을 지워줌.
    listInt.remove(3);
    print('Collections.listRemove 4 : $listInt');

    //
    listInt.clear();
    print('Collections.listRemove 5 : $listInt');
  }

  // 리스트 정렬하기
  void sort() {
    print(" ----------- list 정렬(sort) ----------- ");

    List<int> listInt = [4, 5, 8, 5, 15, 87, 212, 85, 56, 999];
    print('Collections.sort : $listInt');

    // 오른차순으로 정렬하기
    listInt.sort();
    print('Collections.sort 1 : $listInt');

    // 배열 꺼꾸로 하기. 내림차순이 아님. 그냥 오름차순에서 꺼꾸로 보여준것이다,
    List<int> newList = List.from(listInt.reversed);
    print('Collections.sort 2 : $newList');

    // 내림차순 정렬은 스스로 찾아보자
  }

  // Map 타입 : key, value
  // Map = 타입
  // map = 변수명
  // {"Key": "value"} = 초기화(입력한 값)
  // : 을 기준으로 왼쪽이 key, 오른쪽이 value

  // 추후에 json이라는 구조를 배울 꺼임. key, value 형태로 이루어짐.
  void collectionMap() {
    print(" ----------- Map 타입 ----------- ");

    Map map = {
      "Key": "value",
      34123: "임미나",
      4545: true,
      55: 100.1,
      33: 6,
    };
    print('Collections.collectionMap : $map');

    // 1. 읽어보기
    // 2. 추가하기
    // 3. 수정하기
    // 4. 제거하기

    // 1. 읽어보기
    // var 타입은 아무거나 올 수 있음! (String, int, bool 등등 변수타입 전부 쓸수잇다.)
    var result1 = map[55];
    print('Collections.collectionMap : $result1');

    // 2. 추가하기 1 : putIfAbsent
    // 만약에 비어 있다면 데이터를 추가해주세요.
    map.putIfAbsent(("name"), () => "임미나"); // 두번째 ()는 그냥 함수 형식상()임.
    print('Collections.collectionMap : $map');

    // 한번 넣었으면 또 넣을 수가 없다.
    map.putIfAbsent(("name"), () => "임미나2");
    print('Collections.collectionMap : $map');

    // 2. 추가하기 2 : map[key] <- 요게 편함~
    // putIfAbsent와의 차이점 : map[key]은 값이 비어 있을 때는 추가, 값이 있을때는 변경
    map["age"] = 17;
    print('Collections.collectionMap : $map');

    map["age"] = 60;
    print('Collections.collectionMap : $map');

    // 4. 제거하기 : remove함수가 remove 하나 뿐입니다. 그 이유는 제거하는 거는 map에서는 순서가 없기 때문이죠.

    map.remove("age");
    print('Collections.collectionMap : $map');

    // 4-1. 전부 제거하기
    map.clear();
    print('Collections.collectionMap : $map');

    // Map<key의 타입, value의 타입>
    // 보통 key는 String을 쓰고, value는 다양한 타입
    // 다양한 타입 : 아무거나 올수 있다.

    // 아무거나 타입은 dynamic
    // 즉, Map<String, dynamic> 이 형태를 많이쓴다.

    // Map<String, String> 하면 "age": 17 이런 int 타입 안됨.
    Map<String, dynamic> typeMap = {
      "name": "김사나",
      "age": 23,
      "weight": 49.7,
    };
    print('Collections.collectionMap : $typeMap');
  }

  //Set 타입 : List, Map 과 닮았다.
  // List<int> list = [];

  // Set 타입을 만든느 형태는 Map과 비슷하지만, 중복을 허용하지 않습니다.

  void collectionSet() {
    print(" ----------- Set 타입 ----------- ");

    Set set = {"a", "b", "c", 1, 2, 3};
    print('Collections.collectionSet : $set');

    // 읽기, 쓰기, 수정, 제거

    // set.elementAt(0) : 1번째 값 출력하기
    set.elementAt(0);
    var result = set.elementAt(0);
    print('Collections.collectionSet : $result');

    // set.last : 마지막 값 출력
    var result1 = set.last;
    print('Collections.collectionSet : $result1');

    // set.add : 1개 추가
    set.add("name");

    // set.addAll : 여러개 추가
    set.addAll(["age","weight",100]);
    print('Collections.collectionSet : $set');

    // set.remove : 제거
    set.remove("age");
    print('Collections.collectionSet : $set');

    // set.remove : 여러개 제거
    set.removeAll(["weight", 100]);
    print('Collections.collectionSet : $set');

    // set.clear 전부 제거
    set.clear();
    print('Collections.collectionSet : $set');

    // 특정 타입만 쓸수있게 지정할때
    // Set<int> typeSet = {} : int타입만 쓸 수있음.
    Set<int> typeSet = {};
    typeSet.add(50);


  }

}