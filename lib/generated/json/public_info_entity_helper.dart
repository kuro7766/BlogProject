import 'package:blog_project/entity/public_info_entity.dart';

publicInfoEntityFromJson(PublicInfoEntity data, Map<String, dynamic> json) {
	if (json['announcement'] != null) {
		data.announcement = json['announcement'];
	}
	if (json['github'] != null) {
		data.github = json['github'];
	}
	if (json['qq'] != null) {
		data.qq = json['qq'];
	}
	if (json['csdn'] != null) {
		data.csdn = json['csdn'];
	}
	return data;
}

Map<String, dynamic> publicInfoEntityToJson(PublicInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['announcement'] = entity.announcement;
	data['github'] = entity.github;
	data['qq'] = entity.qq;
	data['csdn'] = entity.csdn;
	return data;
}