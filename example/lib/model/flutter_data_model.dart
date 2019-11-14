/*
 * Author: Bangjin Yu
 * CreateTime: 2019-11-14 16:18:56.944491
 * Email: 1227169416@qq.com
 * Address: 梦想小镇互联网村
 */
import 'flutter_data_list_model.dart';
class FlutterDataModel {
	final String name; 
	final int age; 
	final double height; 
	final List list; 
	FlutterDataModel({this.name = '',this.age = 0,this.height = 0.0,this.list,});
	factory FlutterDataModel.fromMap(Map data) {
		return FlutterDataModel(name:data['name'],age:data['age'],height:data['height'],list:data['list'],);
	}
	List<FlutterDataListModel> getFlutterDataListModel(){
		List<FlutterDataListModel> list = [];
		for(Map map in this.list){
			list.add(FlutterDataListModel.fromMap(map));
		}
		return list;
	}

}