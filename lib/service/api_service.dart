// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../model/user_model.dart';
// import 'package:get/get.dart';

//  class Service {

//     static fetchUsersList() async{
    
//         final response =
//         await http.get(Uri.parse("https://breakingbadapi.com/api/characters/"));
//       if(response.statusCode == 200){
//          String data = response.body;
//           var jsonData = jsonDecode(data);
//            print("$jsonData");
//         return (jsonData as List).map((e)=> User.fromJson(e)).toList(); 
     
      
      
//     }else{ Get.snackbar('Error Loading data!',
//           'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
//     }
    
//     }
// }
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../model/user_model.dart';
import 'package:get/get.dart';

 class Service {

    static fetchUsersList() async{
    
    String fileName = "userdata.json";

    var dir = await getTemporaryDirectory();

    File file = new File(dir.path + "/" + fileName);
      if (file.existsSync()) {
      print("Loading from cache");
      var jsonData = file.readAsStringSync();
       var jsonData2 = jsonDecode(jsonData);
       return (jsonData2 as List).map((e)=> User.fromJson(e)).toList(); 
     
    } else {
      print("Loading from API");
          final response =
        await http.get(Uri.parse("https://breakingbadapi.com/api/characters/"));

      if (response.statusCode == 200) {
        
             String data = response.body;
          var jsonData = jsonDecode(data);
           file.writeAsStringSync(data, flush: true, mode: FileMode.write);
        return (jsonData as List).map((e)=> User.fromJson(e)).toList(); 
      }
 else{ Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }

    }}}


