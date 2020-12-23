import 'package:flutter_jjw_client/bean/index_banner_bean_entity.dart';
import 'package:flutter_jjw_client/base/base_bean.dart';

indexBannerBeanEntityFromJson(IndexBannerBeanEntity data, Map<String, dynamic> json) {
	if (json['Code'] != null) {
		data.code = json['Code']?.toInt();
	}
	if (json['Success'] != null) {
		data.success = json['Success'];
	}
	if (json['Data'] != null) {
		data.data = new List<IndexBannerBeanData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new IndexBannerBeanData().fromJson(v));
		});
	}
	if (json['Errors'] != null) {
		data.errors = json['Errors'];
	}
	return data;
}

Map<String, dynamic> indexBannerBeanEntityToJson(IndexBannerBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Code'] = entity.code;
	data['Success'] = entity.success;
	if (entity.data != null) {
		data['Data'] =  entity.data=[].map((v) => v.toJson()).toList();
	}
	data['Errors'] = entity.errors;
	return data;
}

indexBannerBeanDataFromJson(IndexBannerBeanData data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['ActivityName'] != null) {
		data.activityName = json['ActivityName']?.toString();
	}
	if (json['ActivityImg'] != null) {
		data.activityImg = json['ActivityImg']?.toString();
	}
	if (json['Sort'] != null) {
		data.sort = json['Sort']?.toInt();
	}
	if (json['ActivityLink'] != null) {
		data.activityLink = json['ActivityLink']?.toString();
	}
	if (json['ShareUrl'] != null) {
		data.shareUrl = json['ShareUrl']?.toString();
	}
	if (json['ActivityType'] != null) {
		data.activityType = json['ActivityType']?.toInt();
	}
	if (json['Contents'] != null) {
		data.contents = json['Contents']?.toString();
	}
	if (json['StartTime'] != null) {
		data.startTime = json['StartTime']?.toString();
	}
	if (json['EndTime'] != null) {
		data.endTime = json['EndTime']?.toString();
	}
	if (json['CreateTime'] != null) {
		data.createTime = json['CreateTime']?.toString();
	}
	if (json['ActivityScheme'] != null) {
		data.activityScheme = json['ActivityScheme']?.toInt();
	}
	return data;
}

Map<String, dynamic> indexBannerBeanDataToJson(IndexBannerBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['ActivityName'] = entity.activityName;
	data['ActivityImg'] = entity.activityImg;
	data['Sort'] = entity.sort;
	data['ActivityLink'] = entity.activityLink;
	data['ShareUrl'] = entity.shareUrl;
	data['ActivityType'] = entity.activityType;
	data['Contents'] = entity.contents;
	data['StartTime'] = entity.startTime;
	data['EndTime'] = entity.endTime;
	data['CreateTime'] = entity.createTime;
	data['ActivityScheme'] = entity.activityScheme;
	return data;
}