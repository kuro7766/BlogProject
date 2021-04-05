import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:blog_project/generated/json/base/json_field.dart';

class ArticleContentEntity with JsonConvert<ArticleContentEntity> {
	@JSONField(name: "article_content")
	String articleContent;
	@JSONField(name: "article_title")
	String articleTitle;
}
