import 'package:blog_project/entity/test_bean_entity.dart';

testBeanEntityFromJson(TestBeanEntity data, Map<String, dynamic> json) {
	if (json['a'] != null) {
		data.a = json['a'] is String
				? double.tryParse(json['a'])
				: json['a'].toDouble();
	}
	return data;
}

Map<String, dynamic> testBeanEntityToJson(TestBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['a'] = entity.a;
	return data;
}