import 'package:flutter/material.dart';

import 'base_bean.dart';
import 'utils.dart';

abstract class BaseWidget extends StatefulWidget {
  @override
  BaseWidgetState createState() => getState();

  BaseWidgetState getState();
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T>{
  BaseBean baseBean;

  Widget navigationBar; //navigationBar

  Widget appBarWidget; //body

  Widget endDrawerWidget;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: appBarWidget,
          endDrawer: endDrawerWidget,
          body: initBody(),
          bottomNavigationBar: navigationBar,
        ),
        onWillPop: () {
          return Future.value(onBackCallBack());
        });
  }

  Widget initBody() {
    if (baseBean != null) {
      return Container(
          width: double.infinity,
          height: double.infinity,
          child: loadingWidget(buildBody(), baseBean));
    } else {
      return Container(
          width: double.infinity, height: double.infinity, child: buildBody());
    }
  }

  ///子类实现，构建页面body
  Widget buildBody();

  ///点击返回键执行的方法，默认返回true执行系统返回，如果自定义返回请返回false
  bool onBackCallBack() {
    return true;
  }
}
