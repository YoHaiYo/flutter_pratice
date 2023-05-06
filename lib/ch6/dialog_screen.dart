import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogScreen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showMyDialog();
          },
          child: const Text("Dialog호출"),
        ),
      ),
    );
  }

  void showMyDialog() {
    showDialog<String>(
      context: context,
      // barrierDismissible: false : 배경클릭해도 안꺼짐.
      barrierDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.5),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shadowColor: Colors.blueAccent,
          elevation: 10,
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.only(
            bottom: 10,
            left: 30,
            right: 30,
          ),
          insetAnimationDuration: Duration(milliseconds: 500),
          insetAnimationCurve: Curves.bounceOut,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context,"팝업 결과물");
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "다이얼로그",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "검색어를 입력해주세요."),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(onPressed: () {}, child: Text("확인"))),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
