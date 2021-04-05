import 'package:blog_project/entity/tag_name_entity.dart';

tagNameEntityFromJson(TagNameEntity data, Map<String, dynamic> json) {
	if (json['tag_name'] != null) {
		data.tagName = json['tag_name'].toString();
	}
	return data;
}

Map<String, dynamic> tagNameEntityToJson(TagNameEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tag_name'] = entity.tagName;
	return data;
}