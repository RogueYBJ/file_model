# file_model
file_model
目前只能在模拟器上使用，手机上需要获取手机的读写权限，
导入file_model
```
file_model: 
    git: 
	url: https://github.com/RogueYBJ/file_model.git
```
引入
```
import 'package:file_model/file_model.dart';
```
使用
```
FileUtil.fromFileName('flutter.text').writeAsMap({'name':'yubangjin','age':25,'height':178.5});
```





