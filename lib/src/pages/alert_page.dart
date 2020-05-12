import 'package:flutter/material.dart';
class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _mostrarAlerta(context),
          child: Text('Mostrar alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back, color: Colors.white10,),
        ),
      );
  }

  _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
            ),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            },
             child: Text('Cancelar')
             ),
            FlatButton(onPressed: () => Navigator.of(context).pop(),
             child: Text('ok')
             ),
          ],
        );
      }
      

      );
  }
}