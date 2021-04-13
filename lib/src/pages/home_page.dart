import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Componentes")),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
    //print(menuProvider.opciones);
    // menuProvider.cargarData().then((opciones) {
    //   print(opciones);
    // });
    // return ListView(
    //   children: _listaItems(),
    // );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext contexto) {
    final List<Widget> lista = [];
    if (data == null) return [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt["texto"]),
        leading: getIcon(opt["icon"]),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          // final route = MaterialPageRoute(
          //   builder: (contexto) => AlertPage(),
          // );
          // Navigator.push(contexto, route);
          Navigator.pushNamed(contexto, opt["ruta"]);
        },
      );
      lista..add(widgetTemp)..add(Divider());
    });
    return lista;
  }
}
