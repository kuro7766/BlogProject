import 'package:blog_project/entity/article_content_entity.dart';

articleContentEntityFromJson(ArticleContentEntity data, Map<String, dynamic> json) {
	if (json['article_content'] != null) {
		data.articleContent = json['article_content'].toString();
	}
	if (json['article_title'] != null) {
		data.articleTitle = json['article_title'].toString();
	}
	return data;
}

Map<String, dynamic> articleContentEntityToJson(ArticleContentEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['article_content'] = entity.articleContent;
	data['article_title'] = entity.articleTitle;
	return data;
}