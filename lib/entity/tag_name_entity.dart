import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:blog_project/generated/json/base/json_field.dart';

class TagNameEntity with JsonConvert<TagNameEntity> {
	@JSONField(name: "tag_name")
	String tagName;
}
