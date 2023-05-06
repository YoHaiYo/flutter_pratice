import 'package:flutter/material.dart';

class DefaultTabControllerScreen extends StatefulWidget {
  const DefaultTabControllerScreen({Key? key}) : super(key: key);

  @override
  State<DefaultTabControllerScreen> createState() =>
      _DefaultTabControllerScreenState();
}

class _DefaultTabControllerScreenState extends State<DefaultTabControllerScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DefaultTabControllerScreen"),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            _tabBar(),
            Expanded(child: _tabBarView()),
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  tabController.animateTo(0);
                }, child:(Text("처음"))),
                ElevatedButton(onPressed: (){
                  tabController.animateTo(2);
                }, child:(Text("마지막"))),
              ],
              
            )
          ],
        ),
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      controller: tabController,
        labelColor: Colors.black,
        tabs: const [
          Tab(text: "탭1"),
          Tab(text: "탭2"),
          Tab(text: "탭3"),
        ]);
  }

  TabBarView _tabBarView(){
    return TabBarView(
      viewportFraction: 0.9,
      controller: tabController,
      children: [
        Container(color: Colors.redAccent,margin: EdgeInsets.symmetric(horizontal: 5),),
        Container(color: Colors.blueAccent,margin: EdgeInsets.symmetric(horizontal: 5),),
        Container(color: Colors.greenAccent,margin: EdgeInsets.symmetric(horizontal: 5),),
      ],
    );

  }
}
