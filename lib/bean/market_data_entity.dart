import 'package:flutter_jjw_client/generated/json/base/json_convert_content.dart';
import 'package:flutter_jjw_client/generated/json/base/json_field.dart';

class MarketDataEntity with JsonConvert<MarketDataEntity> {
	@JSONField(name: "Code")
	int code;
	@JSONField(name: "Success")
	bool success;
	@JSONField(name: "Msg")
	String msg;
	@JSONField(name: "Data")
	List<MarketDataData> data=new List();
	@JSONField(name: "Errors")
	String errors;
}

class MarketDataData with JsonConvert<MarketDataData> {
	@JSONField(name: "ID")
	int iD;
	@JSONField(name: "MarketName")
	String marketName;
	@JSONField(name: "MarketImg")
	String marketImg;
	@JSONField(name: "MarketDataUrl")
	String marketDataUrl;
	@JSONField(name: "ViceMarketName")
	String viceMarketName;
}
