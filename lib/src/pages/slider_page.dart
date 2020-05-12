import 'package:flutter/material.dart';
class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 10.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(children: <Widget>[
          _crearSlider(),
          _crearCheckbox(),
          _crearSwitch(),
            Expanded(
            child: _crearImagen()
            )
        ],
        ),
      ),
    );
  }

 Widget _crearSlider() {
   return Slider(
     activeColor: Colors.indigoAccent,
     label: 'Tamaño de la imagen:',
      divisions: 10,
     value: _valorSlider,
     min: 10.0,
     max: 400.0,
      onChanged: (!_bloquearCheck) ? (valor) {
        setState(() {
          _valorSlider = valor;
        });
      } : null
      );
 }

 Widget _crearImagen() {
   return Image(
     image: NetworkImage('https://pngimage.net/wp-content/uploads/2018/05/batman-png-3.png'),
     fit: BoxFit.contain,
     width: _valorSlider,
     );
 }

 Widget _crearCheckbox() {
  //  return Checkbox(
  //     value: _bloquearCheck,
  //     onChanged: (valor){
  //       setState(() {
  //         _bloquearCheck = valor;
  //       });
  //     }
  //   );
  return CheckboxListTile(
    title: Text('Bloquear Slider '),
    value: _bloquearCheck,
    onChanged: (valor){
      setState(() {
        _bloquearCheck = valor;
      });
    }
    ); 
 }

 Widget _crearSwitch() {
     return SwitchListTile(
    title: Text('Bloquear Slider '),
    value: _bloquearCheck,
    onChanged: (valor){
      setState(() {
        _bloquearCheck = valor;
      });
    }
    ); 
 }
}