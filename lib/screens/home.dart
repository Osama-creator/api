// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:api/const/color.dart';
import 'package:api/controller/user_controller.dart';
import 'package:api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late List<User> allCharacters;
    final _controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Breaking Bad"),backgroundColor: Colors.black,),
     
  body:Obx(
        () => _controller.isLoading.value ==false
            ? Center(child: const CircularProgressIndicator())
            : ListView.builder(
    itemCount: _controller.usersListe.length,
    itemBuilder: (context, index) {
      return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                 Container(
                  height: 60,
                  width: 60,
                   child: CachedNetworkImage(
                    
              imageUrl: _controller.usersListe[index].image,
              placeholder: (context, url) => const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 150,
              ),
              imageBuilder: (context, image) => CircleAvatar(
                backgroundImage: image,
                radius: 150,
              ),
            ),
                 ),
                // Container(
                //   width: 60,
                //   height: 60,
                //   decoration: BoxDecoration(
                //     color: Colors.black,
                //     borderRadius: BorderRadius.circular(60/2),
                //     // image: DecorationImage(
                //     //   fit: BoxFit.contain,
                //     //   // image: NetworkImage("https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")

                //     //   // image: NetworkImage(_controller.usersListe[index].image)
                //     // )
                //   ),
                // ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width-140,
                      // child: Text("Walter White",style: TextStyle(fontSize: 17),)),
                      child: Text(_controller.usersListe[index].name,style: TextStyle(fontSize: 17),)),
                    SizedBox(height: 10,),
                    // Text("09-07-1958",style: TextStyle(color: Colors.grey),)
                    Text(_controller.usersListe[index].birthday.toString(),style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  ),)
       );
  }
}

