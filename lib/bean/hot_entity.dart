import 'package:flutter_jjw_client/generated/json/base/json_convert_content.dart';
import 'package:flutter_jjw_client/generated/json/base/json_field.dart';

class HotEntity with JsonConvert<HotEntity> {
	@JSONField(name: "Code")
	int code;
	@JSONField(name: "Success")
	bool success;
	@JSONField(name: "Msg")
	String msg;
	@JSONField(name: "Data")
	List<HotData> data=new List();
	@JSONField(name: "Errors")
	dynamic errors;
}

class HotData with JsonConvert<HotData> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "ThemeName")
	String themeName;
	@JSONField(name: "ViceThemeName")
	String viceThemeName;
	@JSONField(name: "TitleImg")
	String titleImg;
	@JSONField(name: "ThemeUrl")
	String themeUrl;
}
