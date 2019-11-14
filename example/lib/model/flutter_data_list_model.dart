/*
 * Author: Bangjin Yu
 * CreateTime: 2019-11-14 16:18:56.960973
 * Email: 1227169416@qq.com
 * Address: 梦想小镇互联网村
 */
class FlutterDataListModel {
	final String name; 
	final int age; 
	final double height; 
	FlutterDataListModel({this.name = '',this.age = 0,this.height = 0.0,});
	factory FlutterDataListModel.fromMap(Map data) {
		return FlutterDataListModel(name:data['name'],age:data['age'],height:data['height'],);
	}

}