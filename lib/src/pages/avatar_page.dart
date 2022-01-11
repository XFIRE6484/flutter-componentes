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
                    "https://lh3.googleusercontent.com/proxy/eZrMDy7n6Q-7d0wdEJI2gutI25ZxIIB-ddMhn1N7QVlzzIhMINrlBRedG4hPLmG24vAfEcZZr3SxdVQ8E3FYEupDof4w4ppMEqe7uI57cavQFjol8aG2NokCW8bfPa4yBbrdD8gwl5fjSe47qhbAbtlL1Al49pVetm7bEzIsE9pB9HjbNF3MvhZv_rNi0UJpVgYIGQ"),
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
        placeholder: AssetImage('assets/jar-loading.gif'),
      )),
    );
  }
}
