import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:blog_project/generated/json/base/json_field.dart';

class ArticleIdEntity with JsonConvert<ArticleIdEntity> {
	@JSONField(name: "article_id")
	int articleId;
}
