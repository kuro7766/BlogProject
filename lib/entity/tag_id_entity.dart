import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:blog_project/generated/json/base/json_field.dart';

class TagIdEntity with JsonConvert<TagIdEntity> {
	@JSONField(name: "tag_id")
	int tagId;
}
