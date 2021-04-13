import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _pass = "";
  String _fecha = "";
  TextEditingController _inputFecha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de Texto"),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearDate(context),
            Divider(),
            _crearDropDown(context),
            Divider(),
            _crearPersona()
          ]),
    );
  }

  TextField _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras ${_nombre.trim().length}"),
          hintText: "Nombre de la Persona",
          labelText: "Nombre",
          helperText: "SOlO ES EL NOMBRE",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Email",
          labelText: "Email",
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "PassWord",
          labelText: "PassWord",
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (valor) => setState(() {
        _pass = valor;
      }),
    );
  }

  Widget _crearDate(BuildContext context) {
    return TextField(
      controller: _inputFecha,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Fecha",
          labelText: "Fecha",
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.date_range)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 11),
      lastDate: DateTime(2021, 4),
      locale: Locale("es", "ES"),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFecha.text = _fecha;
      });
    }
  }

  String _opcionSeleccionada;
  List _poderes = ["Volar", "Rayos X", "Super Aliento", "Fuerza"];
  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        value: poder,
        child: Text(poder),
      ));
    });
    return lista;
  }

  _crearDropDown(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropDown(),
            onChanged: (opt) {
              setState(() => _opcionSeleccionada = opt);
            },
          ),
        )
      ],
    );
  }
}
