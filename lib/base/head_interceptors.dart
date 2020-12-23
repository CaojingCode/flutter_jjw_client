import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import 'utils.dart';

final String OWIN_UID = "Owin-Uid";
final String OWIN_VERSION = "Owin-Version";
final String OWIN_CITY = "Owin-City";
final String OWIN_RAND = "Owin-Rand";
final String OWIN_TS = "Owin-Ts";
final String OWIN_REQUESTT = "Owin-RequestT";
final String OWIN_APPVERSION = "Owin-AppVersion";
final String OWIN_SIGN = "Owin-Sign";
final String OWIN_MAC = "Owin-MAC";
final String SECURITY_KEYVAULE = "0842938C961647768B05FE3ED9E31CD5";

class HeadInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    options.headers = await getHeadMap();
    return super.onRequest(options);
  }

  Future<Map<String, String>> getHeadMap() async {
    Map<String, String> headMap = new HashMap();
    var rand=Random().nextInt(99999).toString();
    var owinTs = new DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var uid = await getUniqueId();
    headMap[OWIN_MAC] = "8e:a8:19:ee:b0:7d";
    headMap[OWIN_UID] = uid;
    headMap[OWIN_VERSION] = "V1";
    headMap[OWIN_CITY] = "1";
    headMap[OWIN_RAND] = rand;
    headMap[OWIN_TS] = owinTs.toString();
    headMap[OWIN_REQUESTT] = Platform.operatingSystem;
    headMap[OWIN_APPVERSION] = await getVersionName();
    String signStr = OWIN_RAND +
        "=" +
        rand+
        "&" +
        OWIN_TS +
        "=" +
        owinTs.toString() +
        "&" +
        OWIN_UID +
        "=" +
        uid +
        "&" +
        "SecurityKey=" +
        SECURITY_KEYVAULE;
    headMap[OWIN_SIGN] = generateMd5(signStr);
    return headMap;
  }
}
