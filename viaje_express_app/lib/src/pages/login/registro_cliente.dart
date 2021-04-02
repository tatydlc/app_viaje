import 'package:flutter/material.dart';
import 'package:viaje_express_app/models/persona.dart';
import 'package:viaje_express_app/models/persona_rol.dart';
import 'package:viaje_express_app/providers/persona_rol_provider.dart';
import 'package:viaje_express_app/providers/personas_provider.dart';
class RegistroPage extends StatefulWidget {

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
 final formKey = GlobalKey<FormState>();
  final personaProvider= new PersonaProvider();
  final personaRolProvider= new PersonaRolProvider();
  Persona persona= new Persona();
  PersonaRol personaRol= new PersonaRol();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
    
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children:<Widget>[
                Padding(padding: EdgeInsets.only(top: 10.0)),
                _crearCedula(),
                Divider(),
                _crearNombre(),
                Divider(),
                _crearApellido(),
                Divider(),
                _crearNacimiento(),
                Divider(),
                _crearDireccion(),
                Divider(),
                _crearCorreo(),
                Divider(),
                _crearTelefono(),
                Divider(),
                _crearNombreUsu(),
                Divider(),
                _crearContrasenia(),
                Divider(),
                _crearBoton(),
               RaisedButton(child: Text('¿Ya tienes cuenta?, Inicia Sesión!'),
          color: Colors.white,
          textColor: Colors.blue,
          onPressed: (){
               Navigator.pop(context);          
          },
          shape: StadiumBorder(),)]
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearCedula(){
    return TextFormField(
      
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Cédula',
          hintText: 'Ingrese su cédula',
          icon: Icon(Icons.picture_in_picture_rounded)),
      onSaved: (value)=>persona.cedulaPersona=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese su cédula';
        }else{
          return null;
        }
      },
    );
  }

   Widget _crearNombre(){
    return TextFormField(
      
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre',
          hintText: 'Ingrese su nombre',
          icon: Icon(Icons.short_text)),
      onSaved: (value)=>persona.nombrePersona=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese su nombres';
        }else{
          return null;
        }
      },
    );
  }

     Widget _crearApellido(){
    return TextFormField(
      
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Apellido',
          hintText: 'Ingrese su apellido',
          icon: Icon(Icons.short_text)),
      onSaved: (value)=>persona.apellidosPersona=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese su Apellido';
        }else{
          return null;
        }
      },
    );
  }
     Widget _crearNacimiento(){
       persona.nacimientoPersona='1998-02-02';
    return TextFormField(
      
      
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Fecha de nacimiento',
          hintText: 'Ingrese su fecha de nacimiento',
          icon: Icon(Icons.date_range_outlined)),
      
      validator: (value){
        if(value.length<3){
          return 'Ingrese su fecha de nacimiento';
        }else{
          return null;
        }
      },
    );
  }
     Widget _crearDireccion(){
    return TextFormField(
      
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Dirección',
          hintText: 'Ingrese su dirección',
          icon: Icon(Icons.location_on_outlined)),
      onSaved: (value)=>persona.direccionPersona=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese su dirección';
        }else{
          return null;
        }
      },
    );
  }
     Widget _crearTelefono(){
    return TextFormField(
      
      
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Teléfono',
          hintText: 'Ingrese su teléfono',
          icon: Icon(Icons.phone_android_sharp)),
      onSaved: (value)=>persona.telefonoPersona=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese su número de teléfono';
        }else{
          return null;
        }
      },
    );
  }
     Widget _crearCorreo(){
    return TextFormField(
      
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Correo',
          hintText: 'Ingrese su correo',
          icon: Icon(Icons.alternate_email_sharp)),
      onSaved: (value)=>persona.correoPersona=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese su email';
        }else{
          return null;
        }
      },
    );
  }
     Widget _crearNombreUsu(){
    return TextFormField(
      
     
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre de usuario',
          hintText: 'Ingrese su nombre de usuario',
          icon: Icon(Icons.account_circle_outlined)),
      onSaved: (value)=>persona.personaNombreUsuario=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese su Nombre de usuario';
        }else{
          return null;
        }
      },
    );
  }
     Widget _crearContrasenia(){
       persona.createdBy=1;
       persona.idPersona=0;
    return TextFormField(
      
      
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Contraseña',
          hintText: 'Ingrese su contraseña',
          icon: Icon(Icons.lock_outline_rounded)),
      onSaved: (value)=>persona.contraseniaPersona=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese su contraseña';
        }else{
          return null;
        }
      },
    );
  }
      Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color:Colors.blue,
      textColor: Colors.white,
      icon: Icon(Icons.save),
      label:Text('Registrarse'),
      onPressed: (){
        _submit();
        Navigator.pushNamed(context, 'login'); 
      },
    );
  }


  void _submit(){
    if(!formKey.currentState.validate()){
      return;
    }else{
      formKey.currentState.save();
      print('ok ${persona.nombrePersona}');
      personaProvider.crearPersona(persona);
     
    }
  }
}