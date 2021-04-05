import 'package:blog_project/entity/artile_title_item_entity.dart';

artileTitleItemEntityFromJson(ArtileTitleItemEntity data, Map<String, dynamic> json) {
	if (json['article_title'] != null) {
		data.articleTitle = json['article_title'].toString();
	}
	if (json['time13'] != null) {
		data.time13 = json['time13'].toString();
	}
	return data;
}

Map<String, dynamic> artileTitleItemEntityToJson(ArtileTitleItemEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['article_title'] = entity.articleTitle;
	data['time13'] = entity.time13;
	return data;
}