import 'package:flutter/material.dart';

class HWToDoList extends StatefulWidget {
  @override
  _HWToDoListState createState() => _HWToDoListState();
}

class _HWToDoListState extends State<HWToDoList> {
  List<String> tasks = [];


  // void addTask() {
  //   setState(() {
  //     tasks.add("New Task");
  //   });
  // }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void editTask(int index, String newTask) {
    setState(() {
      tasks[index] = newTask;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6주차 과제 To-Do-List'),
        actions: [
          IconButton(onPressed: (){addTask();}, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            /// 할일 목록 리스트 
            child: ListView.builder(

              itemCount: tasks.length,
              itemBuilder: (context, index) {

                IconButton(onPressed: () {
                  Icon(Icons.check_box);
                }, icon: Icon(Icons.check_box_outline_blank));

                return ListTile(

                  title: Text(tasks[index]),
                  /// trailing : 타이틑 밑에 표시되는 위젯.
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// 체크박스 쓸줄몰라서 아이콘박스로 모양만 만듬. 눌러도 변화가 안됨...
                      IconButton(onPressed: () {
                        setState(() {
                          Icon(Icons.check_box);
                        });
                      }, icon: Icon(Icons.check_box_outline_blank)),

                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          TextEditingController taskController =
                          TextEditingController(text: tasks[index]);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Edit Task'),
                                content: TextField(
                                  controller: taskController,
                                ),
                                actions: [
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Save'),
                                    onPressed: () {
                                      editTask(index, taskController.text);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTask(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
  
  /// 할일 추가하는 위젯임
  Future<void> addTask() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('할일추가'),
          content: TextField(
            autofocus: true,
            onSubmitted: (String text) {
              setState(() {
                tasks.add(text);
              });
              Navigator.of(context).pop();
            },
            textInputAction: TextInputAction.send,
          ),
        );
      },
    );
  }
  
}
