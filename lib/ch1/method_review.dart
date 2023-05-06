// 1회차 강의 - 23.03.04
// 복습일 : 23.05.05

class MethodReview {
  MethodReview() {
    // String name = talk("임미나", time: DateTime.now().toString());
    //String name = talk("임미나");
    //time을 입력하면 그 시간으로 나오고, 입력안하면 밑에 기본으로 입력한 값으로 나옴.
    // DateTime.now() : 현재 시간보기. time을 toString()으로 글자로 변환하기.
    // print('Method1.Method1 talk : $name');

    String promptInput = Prompt(
      "판타지 마법세계",
      "레이팡",
      "레이팡이 마법학교에 입학하고 마법학교생활을 시작한다."
    );
    print('Prompt : $promptInput');
  }

  // 함수 입력값 optional
  // time 값을 입력해도 되고, 입력하지 않아도 됩니다.
  // 소괄호 안에 있는 입력값은 함수를 호출할때 입력값의 이름을 보여주지 않는다.
  // 하지만 중괄호 안에 있는 입력값은 함술르 호출할때 입력값의 이름을 보여준다.

  // String talk(String name, {String time = "16:50"}) {
  //   return "$name님이 대화를 신청하셨습니다. $time";
  // }

  String Prompt(
    String background,
    String character,
    String storyStart,
  ) {
    return "다음과 같은 내용을 바탕으로 소설을 써라."
        "소설의 배경은 $background 입니다."
        "소설의 주인공은 $character 입니다."
        "소설의 도입부는 다음과 같습니다 : $storyStart ";
  }
}
