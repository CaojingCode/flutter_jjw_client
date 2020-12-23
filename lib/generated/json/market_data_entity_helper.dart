import 'package:flutter_jjw_client/bean/market_data_entity.dart';

marketDataEntityFromJson(MarketDataEntity data, Map<String, dynamic> json) {
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
		data.data = new List<MarketDataData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new MarketDataData().fromJson(v));
		});
	}
	if (json['Errors'] != null) {
		data.errors = json['Errors']?.toString();
	}
	return data;
}

Map<String, dynamic> marketDataEntityToJson(MarketDataEntity entity) {
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

marketDataDataFromJson(MarketDataData data, Map<String, dynamic> json) {
	if (json['ID'] != null) {
		data.iD = json['ID']?.toInt();
	}
	if (json['MarketName'] != null) {
		data.marketName = json['MarketName']?.toString();
	}
	if (json['MarketImg'] != null) {
		data.marketImg = json['MarketImg']?.toString();
	}
	if (json['MarketDataUrl'] != null) {
		data.marketDataUrl = json['MarketDataUrl']?.toString();
	}
	if (json['ViceMarketName'] != null) {
		data.viceMarketName = json['ViceMarketName']?.toString();
	}
	return data;
}

Map<String, dynamic> marketDataDataToJson(MarketDataData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ID'] = entity.iD;
	data['MarketName'] = entity.marketName;
	data['MarketImg'] = entity.marketImg;
	data['MarketDataUrl'] = entity.marketDataUrl;
	data['ViceMarketName'] = entity.viceMarketName;
	return data;
}