import 'package:blog_project/entity/weather_bean_entity.dart';

weatherBeanEntityFromJson(WeatherBeanEntity data, Map<String, dynamic> json) {
	if (json['weatherinfo'] != null) {
		data.weatherinfo = WeatherBeanWeatherinfo().fromJson(json['weatherinfo']);
	}
	return data;
}

Map<String, dynamic> weatherBeanEntityToJson(WeatherBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['weatherinfo'] = entity.weatherinfo?.toJson();
	return data;
}

weatherBeanWeatherinfoFromJson(WeatherBeanWeatherinfo data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['cityid'] != null) {
		data.cityid = json['cityid'].toString();
	}
	if (json['temp1'] != null) {
		data.temp1 = json['temp1'].toString();
	}
	if (json['temp2'] != null) {
		data.temp2 = json['temp2'].toString();
	}
	if (json['weather'] != null) {
		data.weather = json['weather'].toString();
	}
	if (json['img1'] != null) {
		data.img1 = json['img1'].toString();
	}
	if (json['img2'] != null) {
		data.img2 = json['img2'].toString();
	}
	if (json['ptime'] != null) {
		data.ptime = json['ptime'].toString();
	}
	return data;
}

Map<String, dynamic> weatherBeanWeatherinfoToJson(WeatherBeanWeatherinfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['cityid'] = entity.cityid;
	data['temp1'] = entity.temp1;
	data['temp2'] = entity.temp2;
	data['weather'] = entity.weather;
	data['img1'] = entity.img1;
	data['img2'] = entity.img2;
	data['ptime'] = entity.ptime;
	return data;
}