import 'package:flutter/material.dart';
import 'package:viaje_express_app/models/persona.dart';
import 'package:viaje_express_app/models/usuario.dart';
import 'package:viaje_express_app/providers/login_registro_providers/personas_provider.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}
final formKey = GlobalKey<FormState>();
class _LoginPageState extends State<LoginPage> {

  final personaProvider= new PersonaProvider();
  Persona persona= new Persona();
  Usuario usuario= new Usuario();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
    
         appBar: AppBar(
           title: Text('Inicio'),
         ),
         body:  SingleChildScrollView(
          child: Container (
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children:<Widget>[
                Padding(padding: EdgeInsets.only(top: 10.0)),
                _crearNombreUsu(),
                Divider(),
                _crearContrasenia(),
                         
          RaisedButton(child: Text('Iniciar sesión'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: (){
               _submit();
               //Navigator.pushNamed(context, 'home');          
          },
          shape: StadiumBorder(),),
         RaisedButton(child: Text('¿No tienes cuenta?, registrate!'),
          color: Colors.white,
          textColor: Colors.blue,
          onPressed: (){
               Navigator.pushNamed(context, 'registro');          
          },
          shape: StadiumBorder(),)]
            ),
         ))),
        );
       
  }
  Widget _crearNombreUsu() {
    return TextFormField(
      //autofocus: true,
      
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre de usuario',
          hintText: 'Ingrese su Nombre de usuario',
          icon: Icon(Icons.account_circle_outlined)),
      onSaved: (value)=>persona.personaNombreUsuario=value,
    );
  }
    Widget _crearContrasenia() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Ingrese su contraseña',
          labelText: 'Contraseña',
          icon: Icon(Icons.lock_open_rounded),
          ),
      onSaved: (value)=>persona.contraseniaPersona=value,
    );
  }
  _submit()async{
    if(!formKey.currentState.validate()){
      return;
    }else{
      formKey.currentState.save(); 
      Map usuarioMap= await personaProvider.loginUsuario(persona);
      usuario.idPersona=usuarioMap['idUsuario'];
      usuario.personaRolId=usuarioMap['personaRolId'];
      usuario.rolId=usuarioMap['rolId'];
      usuario.createdBy=usuarioMap['createdBy'];
      usuario.personaNombreUsuario=usuarioMap['personaNombreUsuario'];
     print('vista ${usuarioMap['idUsuario']}');
     print('vista ${usuarioMap['personaRolId']}');
     print('vista ${usuarioMap['rolId']}');
     if(usuarioMap['rolId']==7){
       Navigator.popAndPushNamed(context, 'home_cliente', arguments: usuario);
     }else if(usuarioMap['rolId']==6) {
       Navigator.popAndPushNamed(context, 'home_chofer', arguments: usuario);
     }else{
        _mostrarAlerta(context);
     }
     
    }
  }
    void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title:Text('Viaje Express'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:<Widget>[
              Text('Nombre de usuario o contraseña incorrectos'),
              
            ]
            ),
            actions: <Widget>[
              
              FlatButton(
                onPressed: ()=>Navigator.of(context).pop(),
                child: Text('Ok')
              )
            ],
        );

      }
      );
  }
}