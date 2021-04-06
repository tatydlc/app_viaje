import 'package:flutter/material.dart';
import 'package:viaje_express_app/models/solicitud_cliente.dart';
import 'package:viaje_express_app/models/usuario.dart';
import 'package:viaje_express_app/providers/cliente_providers/viaje_express_provider.dart';
class TransportePage extends StatefulWidget {
 

  @override
  _TransportePageState createState() => _TransportePageState();
}

class _TransportePageState extends State<TransportePage> {
  final formKey = GlobalKey<FormState>();
  Usuario usuario = new Usuario();
  SolicitudCliente solCliente=  new SolicitudCliente();
  ViajeProvider viajeProvider= new ViajeProvider();
  @override
  Widget build(BuildContext context) {
      final  Usuario personaArgumento= ModalRoute.of(context).settings.arguments;
   if(personaArgumento!=null){
     usuario=personaArgumento;
   }
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitar un viaje express'),
    
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children:<Widget>[
                Padding(padding: EdgeInsets.only(top: 10.0)),
                _crearSalida(),
                Divider(),
                _crearDestino(),
                Divider(),
                _crearBoton(),
               ]
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearSalida(){
    return TextFormField(
      
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Salida',
          hintText: 'Ingrese la ubicación de salida',
          icon: Icon(Icons.picture_in_picture_rounded)),
      onSaved: (value)=>solCliente.solicitudClienteSalidaSolCliente=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese la ubicación de salida';
        }else{
          return null;
        }
      },
    );
  }

   Widget _crearDestino(){
    return TextFormField(
      
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Destino',
          hintText: 'Ingrese el lugar de Destino',
          icon: Icon(Icons.short_text)),
      onSaved: (value)=>solCliente.solicitudClienteDestinoSolCliente=value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese el lugar de Destino';
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
      label:Text('Enviar solicitud'),
      onPressed: (){
        _submit();
        Navigator.pop(context);
       // Navigator.pushNamed(context, 'home_cliente', arguments: usuario); 
      },
    );
  }


  void _submit(){
    if(!formKey.currentState.validate()){
      return;
    }else{
      formKey.currentState.save();
      solCliente.personaRolId=usuario.personaRolId;
      solCliente.estadoSolicitudId=2;
      solCliente.tipoSolicitudId=2;
      solCliente.createdBy=usuario.idPersona;
      print('oksol ${solCliente.personaRolId}');
      viajeProvider.crearSolicitudViaje(solCliente);
     
    }
  }
}