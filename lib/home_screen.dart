//stl : stateless 위젯 생성 단축키
//stf : statefull 위젯 생성 단축키

import 'package:lecture_230304/ch3/widgets/containter_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture_230304/ch9_selfstudy/stack_screen.dart';

import 'ch3/widgets/0_practice_widget.dart';
import 'ch3/widgets/column_row_widget.dart';
import 'ch3/widgets/column_widget.dart';
import 'ch3/widgets/row_widget.dart';
import 'ch3/widgets/row_widget_test.dart';
import 'ch3/widgets/text_widget.dart';
import 'ch4/button_screen.dart';
import 'ch4/scaffold_widget.dart';
import 'ch4/text_form_field_screen.dart';
import 'ch5/gridview_screen.dart';
import 'ch5/image_screen.dart';
import 'ch5/listview_screen.dart';
import 'ch5/pageview_screen.dart';
import 'ch5/single_scroll_screen.dart';
import 'ch5/ui_exam_1.dart';
import 'ch5/ui_exam_teacher.dart';
import 'ch6/bottom_navigation_bar_screen.dart';
import 'ch6/default_tab_controller_screen.dart';
import 'ch6/dialog_screen.dart';
import 'ch6/route/route_screen.dart';
import 'ch6/tabbar_exam.dart';
import 'ch7/route_named/_main_screen.dart';
import 'ch7/todo_list/todo_list_screen.dart';
import 'ch8/future_screen.dart';
import 'ch8/news_screen.dart';
import 'ch8/open_api_screen.dart';
import 'ch9_selfstudy/animation_practice.dart';
import 'ch9_selfstudy/card_screen.dart';
import 'ch9_selfstudy/checkbox_etc_screen.dart';
import 'ch9_selfstudy/date_picker.dart';
import 'ch9_selfstudy/draggable_widget.dart';
import 'ch9_selfstudy/drop_tracker.dart';
import 'ch9_selfstudy/listview_screen.dart';
import 'ch9_selfstudy/progress_screen.dart';
import 'ch9_selfstudy/textfield_screen.dart';
import 'gpt_test/todolist_down.dart';
import 'ch6/todolist_ch6_homework/hw_todolist.dart';
import 'ch6/ui_exam_1_review.dart';
import 'ch6/widgets/bottom_sheet_screen.dart';
import 'ch6/widgets/tapbar_screen.dart';
import 'gpt_test/shopping_app.dart';
import 'gpt_test/navi_test.dart';
import 'my_practice/carrot_maket.dart';
import 'my_practice/my_chatgpt.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // containter
    return Scaffold(
      appBar: AppBar(
        title: Text("플로터 위젯 연습"),
      ),

      body: GridView.count(
          crossAxisCount: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 2.5,
          children: [
            button2(
                context: context,
                text: "DraggableWidget",
                page: DraggableWidget()),
            button2(
                context: context,
                text: "DropTracker",
                page: DropTracker()),
            button2(
                context: context,
                text: "AnimationPractice",
                page: AnimationPractice()),
            button2(
                context: context,
                text: "★MyChatGPT",
                page: MyChatGPT()),
            button2(
                context: context,
                text: "CarrotMarket",
                page: CarrotMarket()),
            button2(
                context: context,
                text: "MyNavigationBar",
                page: MyNavigationBar()),
            button2(
                context: context,
                text: "ShoppingApp",
                page: ShoppingApp()),
            button2(
                context: context,
                text: "6주차과제 ToDoList",
                page: HWToDoList()),
            button2(
                context: context,
                text: "TodoListScreen",
                page: TodoListScreen()),
            button2(
                context: context,
                text: "RouteNamed",
                page: RouteNamed()),
            button2(
                context: context,
                text: "FutureScreen",
                page: FutureScreen()),
            button2(
                context: context,
                text: "NewsScreen",
                page: NewsScreen()),
            button2(
                context: context,
                text: "OpenApiScreen",
                page: OpenApiScreen()),

            //-------------------------------------//
            // 복습중
            button3(
                context: context,
                text: "ColumnRowWidget",
                page: ColumnRowWidget()),
            button3(
                context: context,
                text: "ColumnWidget",
                page: ColumnWidget()),
            button3(
                context: context,
                text: "ContainerWidget",
                page: ContainerWidget()),
            button3(
                context: context,
                text: "RowWidget",
                page: RowWidget()),
            button3(
                context: context,
                text: "TextWidget",
                page: TextWidget(label: '내용', fontSize: 15,)),
            button3(
                context: context,
                text: "StackScreen",
                page: StackScreen()),
            button3(
                context: context,
                text: "ListviewScreen",
                page: ListviewScreen()),
            button3(
                context: context,
                text: "CardScreen",
                page: CardScreen()),
            button3(
                context: context,
                text: "ProgressScreen",
                page: ProgressScreen()),
            button3(
                context: context,
                text: "TextFieldScreen",
                page: TextFieldScreen()),
            button3(
                context: context,
                text: "CheckboxEtcScreen",
                page: CheckboxEtcScreen()),
            button3(
                context: context,
                text: "DatepickerScreen",
                page: DatepickerScreen()),

            //-------------------------------------//
            button(
                context: context,
                text: "Scaffold, Appbar",
                page: ScaffoldWidget()),
            button(
                context: context,
                text: "TextFormFiledScreen",
                page: TextFormFiledScreen()),
            button(
                context: context, text: "ButtonScreen", page: ButtonScreen()),
            button(context: context, text: "ImageScreen", page: ImageScreen()),
            button(
                context: context,
                text: "SingleScrollScreenState",
                page: SingleScrollScreen()),
            button(
                context: context,
                text: "GridViewScreen",
                page: GridViewScreen()),
            button(
                context: context,
                text: "ListViewScreen",
                page: ListViewScreen()),
            button(
                context: context,
                text: "PageViewScreen",
                page: PageViewScreen()),
            button(
                context: context,
                text: "UIExam1",
                page: UIExam1()),
            button(
                context: context,
                text: "UiExamTeacher",
                page: UiExamTeacher()),
            button(
                context: context,
                text: "UIExam1Review",
                page: UIExam1Review()),
            button(
                context: context,
                text: "BottomNavigationbarScreen",
                page: BottomNavigationbarScreen()),
            button(
                context: context,
                text: "TabBarScreen",
                page: TabBarScreen()),
            button(
                context: context,
                text: "TabBarExamScreen",
                page: TabBarExamScreen()),
            button(
                context: context,
                text: "DefaultTabControllerScreen",
                page: DefaultTabControllerScreen()),
            button(
                context: context,
                text: "DialogScreen",
                page: DialogScreen()),
            button(
                context: context,
                text: "BottomSheetScreen",
                page: BottomSheetScreen()),
            button(
                context: context,
                text: "RouteScreen",
                page: RouteScreen()),
          ],
        ),
    );
  }

  Widget button2({
    required BuildContext context,
    required String text,
    // page : 이동하려는 화면
    required Widget page,
  }) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
        //onPressed : 버튼눌렀을때 활성화싴킴
        onPressed: () {
          print('HomeScreen.button 입니다.');
          // 화면이동
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ));
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Widget button({
    required BuildContext context,
    required String text,
    // page : 이동하려는 화면
    required Widget page,
  }) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        //onPressed : 버튼눌렀을때 활성화싴킴
        onPressed: () {
          print('HomeScreen.button 입니다.');
          // 화면이동
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return page;
            },
           ),
          );
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Widget button3({
    required BuildContext context,
    required String text,
    // page : 이동하려는 화면
    required Widget page,
  }) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        //onPressed : 버튼눌렀을때 활성화싴킴
        onPressed: () {
          print('HomeScreen.button 입니다.');
          // 화면이동
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ));
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

}