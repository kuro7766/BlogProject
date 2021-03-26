import 'package:blog_project/entity/article_id_entity.dart';

articleIdEntityFromJson(ArticleIdEntity data, Map<String, dynamic> json) {
	if (json['article_id'] != null) {
		data.articleId = json['article_id'] is String
				? int.tryParse(json['article_id'])
				: json['article_id'].toInt();
	}
	return data;
}

Map<String, dynamic> articleIdEntityToJson(ArticleIdEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['article_id'] = entity.articleId;
	return data;
}