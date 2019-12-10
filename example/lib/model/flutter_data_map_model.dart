/*
 * Author: Bangjin Yu
 * CreateTime: 2019-12-10 18:28:56.881149
 * Email: 1227169416@qq.com
 * Address: 梦想小镇互联网村
 */
class FlutterDataMapModel {
	final String name; 
	final int age; 
	final double height; 
	FlutterDataMapModel({this.name = '',this.age = 0,this.height = 0.0,});
	factory FlutterDataMapModel.fromMap(Map data) {
		return FlutterDataMapModel(name:data['name'],age:data['age'],height:data['height'],);
	}
	Map toMap(){
		return {'name':name,'age':age,'height':height,};
	}

}