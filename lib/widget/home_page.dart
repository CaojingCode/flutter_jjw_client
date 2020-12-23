import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jjw_client/base/dioinit.dart';
import 'package:flutter_jjw_client/base/utils.dart';

import 'tabbar_home_page.dart';
import 'tabbar_info_page.dart';
import 'tabbar_message_page.dart';
import 'tabbar_personal_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final List<Tab> icons = [
    Tab(
        text: "首页",
        icon: ImageIcon(AssetImage("assets/images/img_bottom_index_v2.png"))),
    Tab(
        text: "吉讯",
        icon: ImageIcon(
            AssetImage("assets/images/img_bottom_information_v2.png"))),
    Tab(
        text: "消息",
        icon: ImageIcon(AssetImage("assets/images/img_bottom_mess_v2.png"))),
    Tab(
        text: "我的",
        icon: ImageIcon(AssetImage("assets/images/img_bottom_my_v2.png")))
  ];

  @override
  void initState() {
    super.initState();
    // spInit();
    initDio();
    tabController = new TabController(length: icons.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: _renderPage(),
        controller: tabController,
        //TabBarView 默认支持手势滑动，若要禁止设置 NeverScrollableScrollPhysics
        // physics: NeverScrollableScrollPhysics(),
        dragStartBehavior: DragStartBehavior.start,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 10,
        child: TabBar(
          controller: tabController,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(style: BorderStyle.none)),
          tabs: icons,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
        ),
      ),
    );
  }

  _renderPage() {
    return [
      new TabBarHomePage(),
      new TabBarInfoPage(),
      new TabBarMessagePage(),
      new TabBarPersonalPage()
    ];
  }
}
