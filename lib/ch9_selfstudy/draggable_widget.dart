import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Color originColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DraggableWidget"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Draggable(
                data: Colors.orangeAccent,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orangeAccent,
                  child: const Center(
                    child: Text(
                      "Box",
                    ),
                  ),
                ),
                onDraggableCanceled: (velocity, offset) {},
                feedback: Container(
                  width: 150,
                  height: 150,
                  color: Colors.orangeAccent.withOpacity(0.5),
                  child: const Center(
                    child: Text(
                      "Box...",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )),
            DragTarget(
              onAccept: (Color color){
                originColor = color;
              },
              builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected
                  ) {
                return Container(
                  width: 200,
                  height: 200,
                  color: accepted.isEmpty ? originColor : Colors.grey.shade200,
                  child: const Center(
                    child: Text("Drag Here"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
