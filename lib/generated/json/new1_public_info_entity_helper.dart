import 'package:blog_project/entity/new1_public_info_entity.dart';

new1PublicInfoEntityFromJson(New1PublicInfoEntity data, Map<String, dynamic> json) {
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
	if (json['announcement_link'] != null) {
		data.announcementLink = json['announcement_link'].toString();
	}
	return data;
}

Map<String, dynamic> new1PublicInfoEntityToJson(New1PublicInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['announcement'] = entity.announcement;
	data['github'] = entity.github;
	data['qq'] = entity.qq;
	data['csdn'] = entity.csdn;
	data['game'] = entity.game;
	data['announcement_link'] = entity.announcementLink;
	return data;
}