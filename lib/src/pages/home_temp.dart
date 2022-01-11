// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class HomePapeTemp extends StatelessWidget {
  final opciones = ["Unos", "Dos", "Tres"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Temp",
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista
        ..add(tempWidget)
        ..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    var widgets = opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + "!"),
            subtitle: Text("Texto!!"),
            leading: Icon(Icons.account_balance_wallet),
          ),
          Divider(),
        ],
      );
    }).toList();
    return widgets;
  }
}
