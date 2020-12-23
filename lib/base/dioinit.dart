import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_jjw_client/base/head_interceptors.dart';
import 'package:flutter_jjw_client/base/log_interceptors.dart';

import 'utils.dart';

String baseUrl = "http://appapi.t.jjw.com/";

// 或者通过传递一个 `options`来创建dio实例
BaseOptions options =
BaseOptions(baseUrl: baseUrl, connectTimeout: 10000, receiveTimeout: 5000);
Dio dio = Dio(options);

initDio() {
  //设置代理
  // var httpclient = dio.httpClientAdapter as DefaultHttpClientAdapter;
  // httpclient.onHttpClientCreate = (client) {
  //   client.findProxy = (uri) {
  //     return "PROXY 192.168.1.29:8888";
  //   };
  // };
  dio.interceptors.add(HeadInterceptors());
  dio.interceptors.add(LogInterceptors());
}
