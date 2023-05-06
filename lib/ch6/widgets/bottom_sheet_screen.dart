import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> with SingleTickerProviderStateMixin{

  late AnimationController animationController;

  @override
  void initState() {
    /// 바텀시트에 사용할 수 있는 컨트롤러
    animationController = BottomSheet.createAnimationController(this);
    animationController.addListener(() {debugPrint(animationController.value.toString());
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomSheetScreen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showBottomSheet();
          },
          child: Text("바텀시트 호출"),
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(

      transitionAnimationController: animationController,

      context: context,
      // elevation:50,
      /// enableDrag: false, : 바텀시트 드래그 안되게 하기. 근데 불편해서 거의 true씀.
      enableDrag: true,

      /// isDismissible: false : 바탕화면 클릭해도 안닫히게 하기
      isDismissible: true,
      barrierColor: Colors.grey.withOpacity(0.5),
      backgroundColor: Colors.cyanAccent.shade200.withOpacity(0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
      ),

      constraints: const BoxConstraints(
        minWidth: 300,
        minHeight: 100,
        maxWidth: 500,
        maxHeight: 1000,
      ),

      isScrollControlled: true,
      

      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                /// 바텀시트 움직이기. 제일위가 1, 아래가 0
                animationController.animateBack(0.3);
              }, child: Text("버튼 0.3")),
            ],
          ),
        );
      },
    );
  }
}
