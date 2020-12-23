import 'package:flutter_jjw_client/bean/hot_entity.dart';

hotEntityFromJson(HotEntity data, Map<String, dynamic> json) {
	if (json['Code'] != null) {
		data.code = json['Code']?.toInt();
	}
	if (json['Success'] != null) {
		data.success = json['Success'];
	}
	if (json['Msg'] != null) {
		data.msg = json['Msg']?.toString();
	}
	if (json['Data'] != null) {
		data.data = new List<HotData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new HotData().fromJson(v));
		});
	}
	if (json['Errors'] != null) {
		data.errors = json['Errors'];
	}
	return data;
}

Map<String, dynamic> hotEntityToJson(HotEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Code'] = entity.code;
	data['Success'] = entity.success;
	data['Msg'] = entity.msg;
	if (entity.data != null) {
		data['Data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['Errors'] = entity.errors;
	return data;
}

hotDataFromJson(HotData data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['ThemeName'] != null) {
		data.themeName = json['ThemeName']?.toString();
	}
	if (json['ViceThemeName'] != null) {
		data.viceThemeName = json['ViceThemeName']?.toString();
	}
	if (json['TitleImg'] != null) {
		data.titleImg = json['TitleImg']?.toString();
	}
	if (json['ThemeUrl'] != null) {
		data.themeUrl = json['ThemeUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> hotDataToJson(HotData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['ThemeName'] = entity.themeName;
	data['ViceThemeName'] = entity.viceThemeName;
	data['TitleImg'] = entity.titleImg;
	data['ThemeUrl'] = entity.themeUrl;
	return data;
}