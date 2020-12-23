// ignore: implementation_imports
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_jjw_client/base/dioinit.dart';
import 'package:flutter_jjw_client/bean/hot_entity.dart';
import 'package:flutter_jjw_client/bean/index_banner_bean_entity.dart';
import 'package:flutter_jjw_client/bean/index_menu_entity.dart';
import 'package:flutter_jjw_client/bean/index_theme_house_entity.dart';
import 'package:flutter_jjw_client/bean/market_data_entity.dart';
import 'package:flutter_jjw_client/bean/sub_data.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

String getIndexBanner =
    "api/Home/SelectAdvertisements"; //app获取app初始化配置(包括首页弹框，首页二楼,江寓入口开关)
String getIndexMenu = "api/Home/SelectAppNavMenu?navAppVersion=v2.8"; //首页菜单
String getThemeHouse = "api/Home/SelectHomePageTheme"; //主题房源
String getHotNewHouse =
    "http://newhouseapi.t.jjw.com/api/Home/SelectHotNewHouseTheme"; //热销新房

String getMarketData = "API/Home/SelectMarketData"; //市场数据

class TabBarHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabBarHomePageState();
  }
}

/// 由于继承了 AutomaticKeepAliveClientMixin类，
/// 所以不能使用自定义的 BaseWidget的buildBody方法来构建页面主体
class TabBarHomePageState extends State<TabBarHomePage>
    with AutomaticKeepAliveClientMixin {
  IndexBannerBeanEntity bannerBean = new IndexBannerBeanEntity();
  IndexMenuEntity menuEntity = new IndexMenuEntity(); //s首页
  IndexThemeHouseEntity themeHouse = new IndexThemeHouseEntity();
  HotEntity hotNewHouse = new HotEntity();
  MarketDataEntity marketData = new MarketDataEntity();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        color: Colors.white,
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: _indexSearchText()),
          SliverToBoxAdapter(child: _indexBanner()),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 20,
          )),
          _indexMenu(),
          SliverToBoxAdapter(child: _indexTittle("主题房源")),
          _indexThemeHouse(),
          SliverToBoxAdapter(child: _indexTittle("热销新房")),
          _indexHotNewHouse(),
          SliverToBoxAdapter(child: _indexTittle("市场数据")),
          _indexMarketData()
        ]));
  }

  ///封装首页栏目标题
  Widget _indexTittle(String tittle) {
    if (tittle == "主题房源" && themeHouse.data.isEmpty) return SizedBox.shrink();
    if (tittle == "热销新房" && hotNewHouse.data.isEmpty) return SizedBox.shrink();
    if (tittle == "市场数据" && marketData.data.isEmpty) return SizedBox.shrink();
    return Container(
        margin: EdgeInsets.all(15),
        child: Text(tittle,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)));
  }

  /// 顶部搜索框
  Widget _indexSearchText() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
        decoration: BoxDecoration(
            //背景
            color: Colors.white,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            //设置四周边框
            // border: Border.all(width: 1, color: Colors.white70),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5, //阴影范围
                  spreadRadius: 3 //阴影浓度
                  ),
            ]),
        child: Container(
            height: 50,
            width: double.infinity,
            child: Row(children: [
              Container(
                  child: Text("武汉"), width: 60, alignment: Alignment.center),
              Container(
                  child: Row(
                children: [
                  Text("|"),
                  SizedBox(width: 50),
                  Text("请输入小区名称/商圈/地铁站")
                ],
              ))
            ])));
  }

  /// 首页轮播图
  Widget _indexBanner() {
    if (bannerBean.data.isEmpty) {
      return Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                "assets/images/hot_bg.png",
                width: double.infinity,
                height: 160,
                fit: BoxFit.fitWidth,
              )));
    } else {
      return SizedBox(
        height: 160,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                child: Image.network(
                  bannerBean.data[index].activityImg,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(6));
          },
          itemCount: bannerBean.data.length,
          pagination: SwiperPagination(alignment: Alignment.bottomCenter),
          autoplay: true,
          viewportFraction: 0.88,
          scale: 0.92,
        ),
      );
    }
  }

  /// 首页菜单栏
  Widget _indexMenu() {
    if (menuEntity.data == null) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Column(children: [
            Image.network(menuEntity.data.navMenu[index].navsIcon,
                width: 50, height: 50),
            SizedBox(height: 5),
            Text(menuEntity.data.navMenu[index].navName)
          ]);
        }, childCount: menuEntity.data.navMenu.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: menuEntity.data.navCol, mainAxisSpacing: 10));
  }

  /// 主题房源
  Widget _indexThemeHouse() {
    if (themeHouse.data.isEmpty) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                  left: getLeft(index, 10.0),
                  right: getRight(index, 10.0)),
              child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          themeHouse.data[index].titleImg,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.black38,
                          colorBlendMode: BlendMode.darken,
                        )),
                    Positioned(
                        left: 10,
                        bottom: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(themeHouse.data[index].themeName,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13)),
                            Text(themeHouse.data[index].viceThemeName,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10))
                          ],
                        ))
                  ]));
        }, childCount: themeHouse.data.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.6));
  }

  /// 新房和市场共用UI
  Widget _newHouseAndMarket(List<SubData> list) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10,childAspectRatio: 1.1),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                  left: getLeft(index, 10.0),
                  right: getRight(index, 10.0)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          list[index].tittleImage,
                          fit: BoxFit.fill,
                          width: 180,
                          height: 120,
                        )),
                    SizedBox(height: 10),
                    Text(list[index].name,
                        style: TextStyle(color: Colors.black, fontSize: 13)),
                    SizedBox(height: 5),
                    Text(list[index].subName,
                        style: TextStyle(color: Colors.grey, fontSize: 10))
                  ]));
        }, childCount: list.length));
  }

  /// 热销新房
  Widget _indexHotNewHouse() {
    if (hotNewHouse.data.isEmpty) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }

    ///将热销新房数据转换成SubData对象，方便Ui共用
    List<SubData> list = new List();
    for (int i = 0; i < hotNewHouse.data.length; i++) {
      SubData subData = new SubData();
      subData.tittleImage = hotNewHouse.data[i].titleImg;
      subData.name = hotNewHouse.data[i].themeName;
      subData.subName = hotNewHouse.data[i].viceThemeName;
      subData.url = hotNewHouse.data[i].themeUrl;
      subData.id = hotNewHouse.data[i].iD;
      list.add(subData);
    }
    return _newHouseAndMarket(list);
  }

  /// 市场数据
  Widget _indexMarketData() {
    if (marketData.data.isEmpty) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }

    ///将市场数据转换成SubData对象，方便Ui共用
    List<SubData> list = new List();
    for (int i = 0; i < marketData.data.length; i++) {
      SubData subData = new SubData();
      subData.tittleImage = marketData.data[i].marketImg;
      subData.name = marketData.data[i].marketName;
      subData.subName = marketData.data[i].viceMarketName;
      subData.url = marketData.data[i].marketDataUrl;
      subData.id = marketData.data[i].iD;
      list.add(subData);
    }
    return _newHouseAndMarket(list);
  }

  /// SliverGrid左边间距
  double getLeft(int index, double num) {
    if (index == 1 || index == 3) {
      return 0.0;
    } else {
      return num;
    }
  }

  /// SliverGrid右边间距
  double getRight(int index, double num) {
    if (index == 0 || index == 2) {
      return 0.0;
    } else {
      return num;
    }
  }

  @override
  void initState() {
    super.initState();
    indexRequest();
  }

  indexRequest() async {
    ///请求首页banner图
    await Future.wait([
      ///首页轮播图
      dio.get(getIndexBanner).then((value) {
        setState(() {
          bannerBean =
              IndexBannerBeanEntity().fromJson(jsonDecode(value.toString()));
        });
      }),

      ///请求首页菜单
      dio.get(getIndexMenu).then((value) {
        setState(() {
          menuEntity = IndexMenuEntity().fromJson(jsonDecode(value.toString()));
        });
      }),

      ///请求主题房源
      dio.get(getThemeHouse).then((value) {
        setState(() {
          themeHouse =
              IndexThemeHouseEntity().fromJson(jsonDecode(value.toString()));
        });
      }),

      /// 热销新房
      dio.get(getHotNewHouse).then((value) => setState(() {
            hotNewHouse = HotEntity().fromJson(jsonDecode(value.toString()));
          })),

      ///市场数据
      dio.post(getMarketData).then((value) => setState(() {
            marketData =
                MarketDataEntity().fromJson(jsonDecode(value.toString()));
          }))
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
