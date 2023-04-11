/// null 이란?
// [어떤 값이 존재하지 않거나 아직 할당하지 않았다.]는 상태
// null 오류를 방지하기 위한 장치
// null-safety : 개발자가 코드를 작성하면서 null이 발생할 수 있는 오류를 잡아주는 것

// 다트는 기본적으로 null을 허용하지 않습니다. -> non-nullable type 이라고 부름.
// 그러나 [?] 기호를 사용하면 nullable 타입을 만들 수 있습니다.
// [?] 기호를 사용하고 초기화를 안해주면 기본 값으로 null이 세팅됩니다.

// int => int 타입 값만 올 수 있다.
// int? => int 타입과 null 값이 올 수 있다. ex) 1,3,4, null
class NullSafety{

  int age = 17;
  String name = "임미나";
  // 얘네는 null 값 못씀

  int? age2;
  String? name2;

// 이렇게 ? 기호를 쓴 얘들만 null값을 쓸 수 있음.

}

/// typedef 함수를 정의하는 키워드
typedef NullFunction = void Function();

typedef StringNullFunction = String Function();

void aa() {}