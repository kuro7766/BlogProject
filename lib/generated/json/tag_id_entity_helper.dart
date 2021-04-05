import 'package:blog_project/entity/tag_id_entity.dart';

tagIdEntityFromJson(TagIdEntity data, Map<String, dynamic> json) {
	if (json['tag_id'] != null) {
		data.tagId = json['tag_id'] is String
				? int.tryParse(json['tag_id'])
				: json['tag_id'].toInt();
	}
	return data;
}

Map<String, dynamic> tagIdEntityToJson(TagIdEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tag_id'] = entity.tagId;
	return data;
}