import 'package:flutter/material.dart';
import 'package:pantalla_cf001/src/pages/formulario_page.dart';

class SecondFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Argumentos parametros = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Second Form Page'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('TUS DATOS'),
              SizedBox(height: 20.0),
              Text('Nombre y Apellido: ${parametros.nombre_apellido}'),
              SizedBox(height: 10.0),
              Text('Correo: ${parametros.correo}'),
              SizedBox(height: 10.0),
              Text('Contraseña: ${parametros.password}'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
