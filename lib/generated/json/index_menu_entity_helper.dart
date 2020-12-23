import 'package:flutter_jjw_client/bean/index_menu_entity.dart';

indexMenuEntityFromJson(IndexMenuEntity data, Map<String, dynamic> json) {
	if (json['Code'] != null) {
		data.code = json['Code']?.toInt();
	}
	if (json['Success'] != null) {
		data.success = json['Success'];
	}
	if (json['Data'] != null) {
		data.data = new IndexMenuData().fromJson(json['Data']);
	}
	if (json['Errors'] != null) {
		data.errors = json['Errors'];
	}
	return data;
}

Map<String, dynamic> indexMenuEntityToJson(IndexMenuEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Code'] = entity.code;
	data['Success'] = entity.success;
	if (entity.data != null) {
		data['Data'] = entity.data.toJson();
	}
	data['Errors'] = entity.errors;
	return data;
}

indexMenuDataFromJson(IndexMenuData data, Map<String, dynamic> json) {
	if (json['NavCol'] != null) {
		data.navCol = json['NavCol']?.toInt();
	}
	if (json['NavMenu'] != null) {
		data.navMenu = new List<NavMenuData>();
		(json['NavMenu'] as List).forEach((v) {
			data.navMenu.add(new NavMenuData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> indexMenuDataToJson(IndexMenuData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['NavCol'] = entity.navCol;
	if (entity.navMenu != null) {
		data['NavMenu'] =  entity.navMenu.map((v) => v.toJson()).toList();
	}
	return data;
}

navMenuDataFromJson(NavMenuData data, Map<String, dynamic> json) {
	if (json['NavName'] != null) {
		data.navName = json['NavName']?.toString();
	}
	if (json['NavsIcon'] != null) {
		data.navsIcon = json['NavsIcon']?.toString();
	}
	if (json['NavRow'] != null) {
		data.navRow = json['NavRow']?.toInt();
	}
	if (json['NavUrl'] != null) {
		data.navUrl = json['NavUrl']?.toString();
	}
	if (json['NavIsHot'] != null) {
		data.navIsHot = json['NavIsHot']?.toInt();
	}
	if (json['NavCol'] != null) {
		data.navCol = json['NavCol']?.toInt();
	}
	if (json['NavSort'] != null) {
		data.navSort = json['NavSort']?.toInt();
	}
	if (json['NavType'] != null) {
		data.navType = json['NavType']?.toInt();
	}
	if (json['CreateTime'] != null) {
		data.createTime = json['CreateTime']?.toString();
	}
	return data;
}

Map<String, dynamic> navMenuDataToJson(NavMenuData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['NavName'] = entity.navName;
	data['NavsIcon'] = entity.navsIcon;
	data['NavRow'] = entity.navRow;
	data['NavUrl'] = entity.navUrl;
	data['NavIsHot'] = entity.navIsHot;
	data['NavCol'] = entity.navCol;
	data['NavSort'] = entity.navSort;
	data['NavType'] = entity.navType;
	data['CreateTime'] = entity.createTime;
	return data;
}