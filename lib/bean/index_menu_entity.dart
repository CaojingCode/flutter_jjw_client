import 'package:flutter_jjw_client/generated/json/base/json_convert_content.dart';
import 'package:flutter_jjw_client/generated/json/base/json_field.dart';

class IndexMenuEntity with JsonConvert<IndexMenuEntity> {
	@JSONField(name: "Code")
	int code;
	@JSONField(name: "Success")
	bool success;
	@JSONField(name: "Data")
	IndexMenuData data;
	@JSONField(name: "Errors")
	dynamic errors;
}

class IndexMenuData with JsonConvert<IndexMenuData> {
	@JSONField(name: "NavCol")
	int navCol;
	@JSONField(name: "NavMenu")
	List<NavMenuData> navMenu;
}

class NavMenuData with JsonConvert<NavMenuData> {
	@JSONField(name: "NavName")
	String navName;
	@JSONField(name: "NavsIcon")
	String navsIcon;
	@JSONField(name: "NavRow")
	int navRow;
	@JSONField(name: "NavUrl")
	String navUrl;
	@JSONField(name: "NavIsHot")
	int navIsHot;
	@JSONField(name: "NavCol")
	int navCol;
	@JSONField(name: "NavSort")
	int navSort;
	@JSONField(name: "NavType")
	int navType;
	@JSONField(name: "CreateTime")
	String createTime;
}
