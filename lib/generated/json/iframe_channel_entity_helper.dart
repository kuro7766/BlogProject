import 'package:blog_project/entity/iframe_channel_entity.dart';

iFrameChannelEntityFromJson(IFrameChannelEntity data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'];
	}
	if (json['counter'] != null) {
		data.counter = json['counter'] is String
				? int.tryParse(json['counter'])
				: json['counter'].toInt();
	}
	return data;
}

Map<String, dynamic> iFrameChannelEntityToJson(IFrameChannelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['msg'] = entity.msg;
	data['counter'] = entity.counter;
	return data;
}