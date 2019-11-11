
/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-11-11 18:49:54 Monday
 */


class FlutterTextModel {
	final String name; 
	final int age; 
	final double height; 
	FlutterTextModel({this.name = '',this.age = 0,this.height = 0.0,});
	factory FlutterTextModel.fromMap(Map data) {
		return FlutterTextModel(name:data['name'],age:data['age'],height:data['height'],);
	}

}