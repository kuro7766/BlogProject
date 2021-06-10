import 'package:blog_project/generated/json/base/json_convert_content.dart';

class WeatherBeanEntity with JsonConvert<WeatherBeanEntity> {
	WeatherBeanWeatherinfo weatherinfo;
}

class WeatherBeanWeatherinfo with JsonConvert<WeatherBeanWeatherinfo> {
	String city;
	String cityid;
	String temp1;
	String temp2;
	String weather;
	String img1;
	String img2;
	String ptime;
}
