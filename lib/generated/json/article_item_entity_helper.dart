import 'package:blog_project/entity/article_item_entity.dart';

articleItemEntityFromJson(ArticleItemEntity data, Map<String, dynamic> json) {
	if (json['article_id'] != null) {
		data.articleId = json['article_id'] is String
				? int.tryParse(json['article_id'])
				: json['article_id'].toInt();
	}
	if (json['picture_url'] != null) {
		data.pictureUrl = json['picture_url'];
	}
	if (json['article_description'] != null) {
		data.articleDescription = json['article_description'].toString();
	}
	return data;
}

Map<String, dynamic> articleItemEntityToJson(ArticleItemEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['article_id'] = entity.articleId;
	data['picture_url'] = entity.pictureUrl;
	data['article_description'] = entity.articleDescription;
	return data;
}