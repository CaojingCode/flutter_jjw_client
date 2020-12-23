import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jjw_client/base/dioinit.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'base_bean.dart';

SharedPreferences _prefs;
//初始化全局信息，会在APP启动时执行
Future spInit() async {
  _prefs = await SharedPreferences.getInstance();
}

Future saveString(String key, String value) async {
  _prefs.setString(key, value);
}

String getSpString(String key) {
  return _prefs.getString(key);
}

Future clearString() async {
  _prefs.clear();
}

Future<PackageInfo> packageInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  // //APP名称
  // String appName = packageInfo.appName;
  // //包名
  // String packageName = packageInfo.packageName;
  // //版本名
  // String version = packageInfo.version;
  // //版本号
  // String buildNumber = packageInfo.buildNumber;
  return packageInfo;
}

Future<String> getUniqueId() async {
  DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.androidId;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.identifierForVendor;
  }
}

//获取版本名称
Future<String> getVersionName() async {
  var packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

//获取版本号
Future<String> getVersionCode() async {
  var packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.buildNumber;
}

// md5 加密
String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return digest.toString();
}

Widget loadingWidget(Widget widget, BaseBean baseBean) {
  if (baseBean.state == ViewState.loading) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.only(top: 30), child: Text("数据加载中。。。。"))
        ]);
  } else if (baseBean.state == ViewState.empty) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30), child: Text("很抱歉！没有数据"))
        ]);
  } else if (baseBean.state == ViewState.error) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30), child: Text("很抱歉！出错了"))
        ]);
  } else {
    return widget;
  }
}
