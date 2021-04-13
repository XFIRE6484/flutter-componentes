import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen ${_valorSlider.toInt()}",
      // divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: _bloquearCheck
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          "https://www.sideshow.com/storage/product-images/904599/iron-man-mark-lxxxv__silo.png"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  bool _bloquearCheck = false;
  _checkBox() {
    return CheckboxListTile(
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
      title: Text("Bloquear Slider"),
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
      title: Text("Bloquear Slider"),
    );
  }
}
