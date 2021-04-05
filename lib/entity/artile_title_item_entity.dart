import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:blog_project/generated/json/base/json_field.dart';

class ArtileTitleItemEntity with JsonConvert<ArtileTitleItemEntity> {
	@JSONField(name: "article_title")
	String articleTitle;
	String time13;
}
