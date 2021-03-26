import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:blog_project/generated/json/base/json_field.dart';

class New1PublicInfoEntity with JsonConvert<New1PublicInfoEntity> {
		String announcement;
		String github;
		String qq;
		String csdn;
		String game;
		@JSONField(name: "announcement_link")
		String announcementLink;
}
