import 'package:flutter/material.dart';

class TextFormFiledScreen extends StatefulWidget {
  const TextFormFiledScreen({Key? key}) : super(key: key);

  @override
  State<TextFormFiledScreen> createState() => _TextFormFiledScreenState();
}

class _TextFormFiledScreenState extends State<TextFormFiledScreen> {
  /// 아이디 6글자 이상입력을 위한 글자수 인식기 만들기
  /// 타입 : TextEditingController, 변수명 : controller
  /// TextFormField 위젯의 행동을 알 수 있음
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFormFiledScreen"),

        /// 뒤로가기 제거할때 : automaticallyImplyLeading: false
        // automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [body(), TextFormField()],
      ),
    );
  }

  // initstate : 화면에 생성됬을때 한번만 호출
  @override
  void initState() {
    /// addListener : controller를 붙인 TextFormField의 값이 변경될때마다 호출됨.
    controller.addListener(() {
      // print('controller : ${controller.text}');

      /// setState : 화면을 계속 갱신시켜줌.
      setState(() {});
    });
    print('_TextFormFiledScreenState.initState');
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          TextFormField(
            // 생성한 TextEditingController를 TextFormField에 붙였다.
            controller: controller,

            style: TextStyle(fontSize: 20),
            cursorColor: Colors.blueAccent,
            cursorWidth: 3,
            cursorHeight: 25,
            // cursorRadius : 커서 끝에 둥글게

            // maxLines : 화면에 보여지는 line의 개수수
           maxLines: 3,

            // maxLength : 최대 글자수 : 0/10 이런식으로 표시됨.
            maxLength: 10,

            // onChanged : 글자가 바뀔때마다 호출
            onChanged: (value) {
              print('value : $value');

            },

            onEditingComplete: () {
              print('onEditingComplete');
            },

            cursorRadius: Radius.circular(3),
            decoration: InputDecoration(
              /// hintText : 글자 입력전에 보여주는 텍스트에요. 주로 아이디, 비번에 씀.
              hintText: "아이디를 입력하세요.",
              hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
              hintMaxLines: 1,

              // focus가 잡혔을때, 커서가 깜빡일때.
              focusedBorder: customBorder(3, Colors.green),

              /// enabledBorder : 무적권 입력해야되는거 표시. 예를들어 회원가입시 비번
              /// TextFormField 활성화 됬을때 사용
              enabled: true,
              enabledBorder: customBorder(3, Colors.blue),

              /// errorBorder가 나오는 조건 : errorText에 값을 입력해한다.
              /// errorBorder가 안나오는조건 :
              /// 1. errorText를 사용하지 않는경우
              /// 2. errorText에 null을 넣어주면됨.
              /// 기획조건 : 6글자 미만인 경우 에러 문구를 보여주고 싶다.
              errorBorder: customBorder(3, Colors.red),

              // focus는 커서가 있는 경우
              // focusedErrorBorder를 구현하지 않으면 기본 errorBorder가 적용됩니다.
              focusedErrorBorder: customBorder(5, Colors.red),

              contentPadding: EdgeInsets.all(16),
              
              errorText: checkErrorText(),
              errorStyle: TextStyle(
                fontSize: 15,
              ),
              errorMaxLines: 1,
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // TextFormField(
          //   style: TextStyle(fontSize: 20),
          //   cursorColor: Colors.blueAccent,
          //   cursorWidth: 3,
          //   cursorHeight: 25,
          //   // cursorRadius : 커서 끝에 둥글게
          //   cursorRadius: Radius.circular(3),
          //   decoration: InputDecoration(
          //     /// hintText : 글자 입력전에 보여주는 텍스트에요. 주로 아이디, 비번에 씀.
          //     hintText: "비밀번호를 입력하세요.",
          //     hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          //     hintMaxLines: 1,
          //     focusedBorder: customBorder(3, Colors.green),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       child: Text(
          //         "회원가입",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 20,
          //         ),
          //       ),
          //       alignment: Alignment.center,
          //       height: 40,
          //       width: 120,
          //       color: Colors.blueAccent,
          //     ),
          //     Container(
          //       child: Text(
          //         "로그인",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 20,
          //         ),
          //       ),
          //       alignment: Alignment.center,
          //       height: 40,
          //       width: 120,
          //       color: Colors.blueAccent,
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }

  InputBorder customBorder(double width, Color color) {
    /// OutlineInputBorder : 박스형태 입력상자
    return OutlineInputBorder(
      borderSide: BorderSide(width: width, color: color),
      borderRadius: BorderRadius.circular(20),
    );
    /// UnderlineInputBorder : 밑줄있는 입력상자
    // return UnderlineInputBorder(
    //   borderSide: BorderSide(width: width, color: color),
    // );
  }

  /// ?기호가 있으면 null을 의미한다.
  /// String? : return할 수 있는 값은 String 이거나 null입니다.
  String? checkErrorText() {
    //글자 체크 1
    // if(controller.text ==""){
    //
    // }
    // //글자 체크 2 : lenth는 길이를 의미함.
    // //아무것도 안쓰면 길이 0
    // if(controller.text.length == 0){
    //
    // }

    // 글자 체크 3 : empty의 뜻은 비어있다.
    // 비어있으면 true, 한글자라도 있으면 false 리턴
    if (controller.text.isEmpty) {
      print('아무것도 입력없음');
      return null;
    }

    // 글자수가 6미만일 경우
    if (controller.text.length < 6) {
      print("6글자 미만");
      return "6글자 이상 입력해주세요.";
    }
    print("6글자 이상");
    return null;
  }
}
