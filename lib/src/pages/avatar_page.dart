 import 'package:flutter/material.dart';

 class AvatarPage extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Avatar Page'),
         actions: <Widget>[
           Container(
             padding: EdgeInsets.all(5),
             child: CircleAvatar(
               backgroundImage: NetworkImage(
                 'https://cdn.dribbble.com/users/2364329/screenshots/6676961/02.jpg'
               ),
               radius: 25.0,
             ),
           ),
           Container(
             margin: EdgeInsets.only(right: 10.0),
             child: CircleAvatar(
               child: Text('IR'),
               backgroundColor: Colors.pink,
             ),
           )
         ],
       ),
       body: Center(
         child: FadeInImage(
           placeholder: AssetImage('assets/original.gif'),
           fadeInDuration: Duration(milliseconds: 200),
          image: NetworkImage(
                 'https://cdn.dribbble.com/users/2364329/screenshots/6676961/02.jpg'

          ))
       ),
     );
   }
 }