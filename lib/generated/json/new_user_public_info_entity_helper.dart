import 'package:blog_project/entity/new_user_public_info_entity.dart';

newUserPublicInfoEntityFromJson(NewUserPublicInfoEntity data, Map<String, dynamic> json) {
	if (json['announcement'] != null) {
		data.announcement = json['announcement'].toString();
	}
	if (json['github'] != null) {
		data.github = json['github'].toString();
	}
	if (json['qq'] != null) {
		data.qq = json['qq'].toString();
	}
	if (json['csdn'] != null) {
		data.csdn = json['csdn'].toString();
	}
	if (json['game'] != null) {
		data.game = json['game'].toString();
	}
	return data;
}

Map<String, dynamic> newUserPublicInfoEntityToJson(NewUserPublicInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['announcement'] = entity.announcement;
	data['github'] = entity.github;
	data['qq'] = entity.qq;
	data['csdn'] = entity.csdn;
	data['game'] = entity.game;
	return data;
}