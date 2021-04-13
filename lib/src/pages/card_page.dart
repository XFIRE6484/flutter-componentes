import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(padding: EdgeInsets.all(10), children: <Widget>[
        _cardTipo1(),
        SizedBox(
          height: 30.0,
        ),
        _cardTipo2()
      ]),
    );
  }
}

Widget _cardTipo2() {
  final tarjeta = Container(
    child: Column(children: <Widget>[
      FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage("https://wallpaperaccess.com/full/24243.jpg"),
        height: 300.0,
        fit: BoxFit.cover,
      ),
      // Image(image: NetworkImage("https://wallpaperaccess.com/full/24243.jpg")),
      Container(padding: EdgeInsets.all(10.0), child: Text("Texto texto texto"))
    ]),
  );
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0))
        ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: tarjeta,
    ),
  );
}

Widget _cardTipo1() {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text("Titulo Tarjeta"),
          subtitle: Text("Titulo Tarjeta"),
          leading: Icon(
            Icons.photo_album,
            color: Colors.blue,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Ok"),
              onPressed: () {},
            )
          ],
        )
      ],
    ),
  );
}
