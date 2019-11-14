/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-11-11 18:49:35 Monday
 */


import 'dart:io';


class FileUtil {
  //在使用前请配置文件存储路径
  static String filePath;
  final File file;
  final String fileName;
  //这里配置署名
  String _headerStr = '/*\n * Author: Bangjin Yu\n * CreateTime: ${DateTime.now()}\n * Email: 1227169416@qq.com\n * Address: 梦想小镇互联网村\n */\n';
  String _keyValue = '';
  List _arrEnd = [];

  FileUtil(this.file, this.fileName);

  ///fileName:文件名“_”请使用“.”来代替 例如:flutter_text -> flutter.text  
  ///生成 flutter_text_model.dart 文件 和 flutterTextModel 类
  factory FileUtil.fromFileName(String fileName) {
    if (filePath == null) {
      throw ('请配置创建文件路径');
    }
    fileName = fileName.replaceAll('.', '_');
    return FileUtil(File(filePath + fileName + '_model.dart'), fileName);
  }

  Future<bool> writeAsMap(Map data) async {
    if (await file.exists()) {
      await file.create();
    }
    try {
      file.writeAsString(_dataToString(data));
    } catch (e) {
      return false;
    }
    print(file.path);
    return true;
  }

  String _dataToString(Map data) {
    String string = '';
    string += 'class ${_getClassName()} {\n';
    string += _getFiledMethods(data);
    string += _getFactoryMethods(data);
    for (String text in _arrEnd) {
      string += text;
    }
    return _headerStr + string +'\n}';
  }

  ///工厂方法
  String _getFactoryMethods(Map data){
    String factorys = '\tfactory ${_getClassName()}.fromMap(Map data) {\n\t\treturn ${_getClassName()}($_keyValue);\n\t}\n';
    return factorys;
  }

  ///实例方法
  String _getFiledMethods(Map data){
    String filed = '';
    String methods = '\t' + _getClassName() + '({';
    _keyValue = '';
    data.forEach((k,v){
      filed += '\tfinal ${_getFiledName(v,k)} $k; \n';
      methods+= 'this.$k${_initData(v)}';
    });
    methods += '});\n';
    return filed + methods;
  }

  ///类名
  String _getClassName(){
    List<String> list = fileName.split('_');
    String className = '';
    for (String name in list) {
      String s = name;
      String e = name;
      className += s.substring(0,1).toUpperCase()+e.substring(1);
    }
    className += 'Model';
    return className;
  }

  ///初始化赋值
  String _initData(value){
    String data = ' = \'\',';
    if (value is String) {
      data = ' = \'\',';
    }else if (value is int) {
      data = ' = 0,';
    }else if (value is double) { 
      data = ' = 0.0,';
    }else if (value is bool) {
      data = ' = false,';
    }else if (value is Map) {
      data = ',';
    }else if (value is List) {
      data = ',';
    }
    return data;
  }

  ///属性名称
  String _getFiledName(value,k) {
    String className = 'String';
    String key_value = '$k:data[\'$k\'],';
    
    if (value is String) {
      className = 'String';
    }else if (value is int) {
      className = 'int';
    }else if (value is double) { 
      className = 'double';
    }else if (value is bool) {
      className = 'bool';
    }else if (value is Map) {
      className = 'Map';
      FileUtil fileUtil = FileUtil.fromFileName(fileName + '_$k');      
      _headerStr += 'import \'${fileUtil.fileName}_model.dart\';\n';
      className = fileUtil._getClassName();
      key_value = '$k:$className.fromMap(data[\'$k\']),';
      fileUtil.writeAsMap(value);
    }else if (value is List) {
      className = 'List';
      FileUtil fileUtil = FileUtil.fromFileName(fileName + '_$k');
      _headerStr += 'import \'${fileUtil.fileName}_model.dart\';\n';
      fileUtil.writeAsMap(value[0]);
      _arrEnd.add('\t$className<${fileUtil._getClassName()}> get${fileUtil._getClassName()}(){\n\t\t$className<${fileUtil._getClassName()}> list = [];\n\t\tfor(Map map in this.list){\n\t\t\tlist.add(${fileUtil._getClassName()}.fromMap(map));\n\t\t}\n\t\treturn list;\n\t}\n');
    }
    _keyValue += key_value;
    return className;
  }
}
