import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 250.0;
  bool _blockSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockSlider)
          ? null
          : (double valor) {
              setState(() {
                _sliderValue = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
        image: NetworkImage(
            "https://www.megaidea.net/wp-content/uploads/2020/03/Batman-clipart-9-958x1024.png"),
        placeholder: AssetImage('data/assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        width: _sliderValue,
        fit: BoxFit.contain);
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      title: Text("Bloquear slider"),
      value: _blockSlider,
      onChanged: (bool valor) {
        setState(() {
          _blockSlider = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear slider"),
      value: _blockSlider,
      onChanged: (bool valor) {
        setState(() {
          _blockSlider = valor;
        });
      },
    );
  }
}
