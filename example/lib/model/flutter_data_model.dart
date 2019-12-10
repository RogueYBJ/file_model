/*
 * Author: Bangjin Yu
 * CreateTime: 2019-12-10 18:28:56.878076
 * Email: 1227169416@qq.com
 * Address: 梦想小镇互联网村
 */
import 'flutter_data_list_model.dart';
import 'flutter_data_map_model.dart';
class FlutterDataModel {
	final String name; 
	final int age; 
	final double height; 
	final List list; 
	final FlutterDataMapModel map; 
	FlutterDataModel({this.name = '',this.age = 0,this.height = 0.0,this.list,this.map,});
	factory FlutterDataModel.fromMap(Map data) {
		return FlutterDataModel(name:data['name'],age:data['age'],height:data['height'],list:data['list'],map:FlutterDataMapModel.fromMap(data['map']),);
	}
	Map toMap(){
		return {'name':name,'age':age,'height':height,'list':list,'map':map.toMap(),};
	}
	List<FlutterDataListModel> getFlutterDataListModel(){
		List<FlutterDataListModel> list = [];
		for(Map map in this.list){
			list.add(FlutterDataListModel.fromMap(map));
		}
		return list;
	}

}