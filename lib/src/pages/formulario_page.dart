import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  //TextEditingController nombreTextController;
  //TextEditingController apellidoTextController;
  FocusNode nombreFocus, correoFocus, passwordFocus;

  String nombre_apellido;
  String correo;
  String password;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Carlos Fernando Soto Zepeda'),
          backgroundColor: Colors.cyan.shade800,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: formKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    child: Image.network(
                        'https://media.datacenterdynamics.com/media/images/oracle_cloud.width-880.png'),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      labelText: 'Nombre y Apellido',
                      hintText: 'Ejemplo: Juan Pérez',
                    ),
                    onSaved: (value) {
                      nombre_apellido = value;
                    },
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo no puede estar vacio';
                      } else {
                        return null;
                      }
                    },
                    focusNode: nombreFocus,
                    onEditingComplete: () {
                      requestFocus(context, correoFocus);
                    },
                    textInputAction: TextInputAction.next,
                    //controller: nombreTextController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Correo',
                        hintText: 'example@gmail.com'),
                    onSaved: (value) {
                      correo = value;
                    },
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo no puede estar vacio';
                      } else {
                        return null;
                      }
                    },
                    focusNode: correoFocus,
                    onEditingComplete: () =>
                        requestFocus(context, passwordFocus),
                    textInputAction: TextInputAction.next,
                    //controller: apellidoTextController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        labelText: 'Password'),
                    onSaved: (value) {
                      password = value;
                    },
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Este campo no puede estar vacio';
                      } else {
                        return null;
                      }
                    },
                    focusNode: passwordFocus,
                    onEditingComplete: () {
                      envioFormulario();
                    },
                    //controller: apellidoTextController,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.cyanAccent.shade700,
                    textColor: Colors.white,
                    onPressed: () {
                      envioFormulario();
                    },
                    child: Text('Enviar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void envioFormulario() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      if (correo.compareTo('carlosf.soto1222@gmail.com') == 0 &&
          password.compareTo('qwerty') == 0) {
        Navigator.pushNamed(context, 'formulario_dos',
            arguments: Argumentos(
                nombre_apellido: this.nombre_apellido,
                correo: this.correo,
                password: this.password));
      }
    }
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void initState() {
    super.initState();
    nombreFocus = FocusNode();
    correoFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    nombreFocus.dispose();
    correoFocus.dispose();
    passwordFocus.dispose();
  }
}

class Argumentos {
  String nombre_apellido, correo, password;

  Argumentos({this.nombre_apellido, this.correo, this.password});
}
