import 'package:flutter/material.dart';
import 'package:lecture_230304/ch7/todo_list/todo_model.dart';
// import 'package:todo_list/todo_model.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoModel> todoList = [];

  // initstate : 화면에 생성됬을때 한번만 호출
  @override
  void initState() {
    super.initState();

    /// 단축키 : ctrl + D : 현재줄복사
    todoList.add(TodoModel("운동", false));
    todoList.add(TodoModel("요리", true));
    todoList.add(TodoModel("조깅", true));
    todoList.add(TodoModel("공부", false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoListScreen"),
        actions: [
          IconButton(
              onPressed: () {
                /// 팝업 호출
                _dialog();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: _listView(),
    );
  }

  Widget _listView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        print('index : $index');

        /// index는 리스트의 번호
        return _listTile(todoList[index], index);
      },
      separatorBuilder: (context, index) {
        /// Divider : 구분선 위젯
        return Divider(
          height: 1,
          thickness: 1,
          color: Colors.green,
        );
      },
      itemCount: todoList.length,
    );
  }

  Widget _listTile(TodoModel todoModel, int index) {
    TextStyle textStyle = TextStyle(
      fontSize: 18,
    );
    if (todoModel.complete) {
      textStyle = const TextStyle(
          fontSize: 18,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: Colors.redAccent,
          decorationThickness: 2.5,

          /// lineThrough : 중간선 그리기
          decoration: TextDecoration.lineThrough);
    }
    return ListTile(
      title: Text(
        todoModel.text,
        style: textStyle,
      ),
      leading: _checkbox(todoModel),
      trailing: _delete(index),

      /// 좌우 패딩
      contentPadding: EdgeInsets.symmetric(horizontal: 10),

      /// listTile의 세로 패딩
      minVerticalPadding: 20,
      horizontalTitleGap: 15,
    );
  }

  Widget _checkbox(TodoModel todoModel) {
    /// todoModel.complete : 체크가 됨
    /// Checkbox 자체 사이즈 변경이 없음 -> Transform.scale 로 묶어서 조절하기
    return Transform.scale(
      scale: 1.1,
      child: Checkbox(
        value: todoModel.complete,

        /// onChanged : 체크박스를 클릭할 때 들어오는 변수
        onChanged: (value) {
          /// complete에다가 현재 complete 의 반대값을 입력.
          setState(() {
            todoModel.complete = !todoModel.complete;
          });
        },

        /// overlayColor: 꾹 눌렀을때 나오는 색상
        overlayColor: MaterialStatePropertyAll(Colors.greenAccent),
        splashRadius: 25,

        /// fillColor : 체크박스 자체의 색
        fillColor: MaterialStatePropertyAll(Colors.green),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  Widget _delete(int index) {
    return IconButton(
        onPressed: () {
          setState(() {
            todoList.removeAt(index);
          });
        },
        icon: Icon(Icons.delete));
  }

  String inputText = "";

  void _dialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Text("Todo-list 추가"),
          titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
          content: TextFormField(
            /// 이 부분이 실제로 텍스트를 할일에 추가하는 부분
            onChanged: (value) {
              inputText = value;
              /// 여기 프린트는 RUN창에서 출력되는거라 상관없음.
              print('value : $value');
            },
            // autofocus: true : 키보드가 자동으로 올라옴.
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "할일을 입력하세요",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          actions: [
            Row(
              children: [
                _dialogButton(
                  text: "취소",
                  backgroundColor: Colors.grey.shade300,
                  onPressed: () {
                    print("취소");
                    Navigator.pop(context);
                  },
                ),
                _dialogButton(
                  text: "추가",
                  backgroundColor: Colors.blue.shade700,
                  onPressed: () {
                    print("추가 $inputText");
                    todoList.add(TodoModel(inputText, false));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    ).then((value){
      /// inputText = "" : 입력할때마다 새롭게 값을 입력하기 위함.
      inputText = "";
      setState(() {
      });
    });
  }

  Widget _dialogButton({
    required String text,
    required Color backgroundColor,
    required Function() onPressed,
  }) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(text),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}