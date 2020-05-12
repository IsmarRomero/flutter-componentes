import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = 
    ['Volar', 'Rayos X','Super Aliento', 'Super Fuerza'];
  TextEditingController _inputFieldDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical:20.0 ),
        children: <Widget>[
           _crearInput(),
           Divider(),
           _crearEmail(),
           Divider(),
           _crearPassword(),
             Divider(),
           _crearFecha(),
           Divider(),
           _crearDropDown(),
           Divider(),
           _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      autocorrect: false,
      onChanged: (String valor) {
        setState(() {
        _nombre = valor;        
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      autocorrect: false,
      onChanged: (String valor) {
        setState(() {
        _email = valor;        
        });
      },
    );
  }

  Widget _crearPassword() {
     return TextField(
       obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      autocorrect: false,
      onChanged: (String valor) {
        setState(() {
        _email = valor;        
        });
      },
    );
  }

  Widget _crearFecha() {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today)
      ),
      autocorrect: false,
    
      onTap: () {
        FocusScope.of(context).requestFocus(
          new FocusNode()
        ); 
        _selectDate();
      },
    );
  }

  void _selectDate() async {
    DateTime pick = await showDatePicker(
      context: context,
     initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
       lastDate: new DateTime(2025)
       ,locale: Locale('es', 'ES')
       );

       if (pick != null) {
         setState(() {
           _fecha = pick.toString();
           _inputFieldDateController.text = _fecha;
         });
       }
  }

  List<DropdownMenuItem<String>> _getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
        ));
    }); 
    return lista;
  } 
  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all ),
        SizedBox(width: 30.0,), 
        Expanded(
            child: DropdownButton(
            value: _opcionSeleccionada,
            items: _getOpcionesDropDown(),
            onChanged: (opt) {
              setState(() {
              _opcionSeleccionada = opt;
              });
            }
          ),
        ),
      ],
    );
  }
}