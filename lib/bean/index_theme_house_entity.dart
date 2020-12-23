import 'package:flutter_jjw_client/generated/json/base/json_convert_content.dart';
import 'package:flutter_jjw_client/generated/json/base/json_field.dart';

class IndexThemeHouseEntity with JsonConvert<IndexThemeHouseEntity> {
	@JSONField(name: "Code")
	int code;
	@JSONField(name: "Success")
	bool success;
	@JSONField(name: "Msg")
	String msg;
	@JSONField(name: "Data")
	List<IndexThemeHouseData> data=[];
	@JSONField(name: "Errors")
	String errors;
}

class IndexThemeHouseData with JsonConvert<IndexThemeHouseData> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "ThemeName")
	String themeName;
	@JSONField(name: "TitleImg")
	String titleImg;
	@JSONField(name: "ViceThemeName")
	String viceThemeName;
	@JSONField(name: "ThemeUrl")
	String themeUrl;
}
