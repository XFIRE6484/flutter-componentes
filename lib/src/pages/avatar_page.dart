import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://hipertextual.com/files/2020/11/Stan_Lee_Painting_by_Abijith_Ka_Full_Quality-740x490.png"),
                radius: 25.0),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child:
                CircleAvatar(child: Text("EO"), backgroundColor: Colors.green),
          )
        ],
      ),
      body: Center(
          child: FadeInImage(
        image: NetworkImage(
            "https://www.alfabetajuega.com/wp-content/uploads/2021/01/luciano-berutti-comp-stanlee-770x1259.jpg"),
        placeholder: AssetImage("assets/jar-loading.gif"),
      )),
    );
  }
}
