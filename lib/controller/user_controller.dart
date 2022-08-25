import 'dart:convert';

import 'package:api/model/user_model.dart';
import 'package:api/model/users.dart';
import 'package:get/get.dart';

import '../service/api_service.dart';


class Controller extends GetxController {
  var usersListe = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
     fetchUsersList();
    super.onInit();
  }
  

  void fetchUsersList() async{
     try{
       var list = await Service.fetchUsersList();
       if(list != null){
       // if iterable data use listMachine.(list);
       // or listMachine.assignAll(list);
       //if not iterable use listMachine.add(list);
        usersListe.addAll(list);
    }
 }finally{
     }
   }
    
    }
// Future<void> fetchUsersList() async {
//     try {
//       http.Response response = await http.get(Uri.parse("https://randomuser.me/api/"));
//       if (response.statusCode == 200) {
//         String data = response.body;
//         var jsonData = jsonDecode(data);
//         UsersList users = UsersList.fromJson(jsonData);
//         List<User> usersList =
//             users.users.map((e) => User.fromJson(e)).toList();
//           usersList.add(
//           User(email: Us, image: users.image, name: users.name));
//       isLoading.value = false;
//       update();
//       } else {
//         print('status code = ${response.statusCode}');
//       }
//     } catch (ex) {
//       print(ex);
//     }
//   }
// }
