import 'package:flutter_jjw_client/base/base_bean.dart';
import 'package:flutter_jjw_client/generated/json/base/json_convert_content.dart';
import 'package:flutter_jjw_client/generated/json/base/json_field.dart';

class IndexBannerBeanEntity with JsonConvert<IndexBannerBeanEntity> ,BaseBean{
	@JSONField(name: "Code")
	int code;
	@JSONField(name: "Success")
	bool success;
	@JSONField(name: "Data")
	List<IndexBannerBeanData> data=[];
	@JSONField(name: "Errors")
	dynamic errors;
}

class IndexBannerBeanData with JsonConvert<IndexBannerBeanData> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "ActivityName")
	String activityName;
	@JSONField(name: "ActivityImg")
	String activityImg;
	@JSONField(name: "Sort")
	int sort;
	@JSONField(name: "ActivityLink")
	String activityLink;
	@JSONField(name: "ShareUrl")
	String shareUrl;
	@JSONField(name: "ActivityType")
	int activityType;
	@JSONField(name: "Contents")
	String contents;
	@JSONField(name: "StartTime")
	String startTime;
	@JSONField(name: "EndTime")
	String endTime;
	@JSONField(name: "CreateTime")
	String createTime;
	@JSONField(name: "ActivityScheme")
	int activityScheme;
}
