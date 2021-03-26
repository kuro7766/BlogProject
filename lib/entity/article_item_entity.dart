import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:blog_project/generated/json/base/json_field.dart';

class ArticleItemEntity with JsonConvert<ArticleItemEntity> {
	@JSONField(name: "article_id")
	int articleId;
	@JSONField(name: "picture_url")
	dynamic pictureUrl;
	@JSONField(name: "article_description")
	String articleDescription;
}
