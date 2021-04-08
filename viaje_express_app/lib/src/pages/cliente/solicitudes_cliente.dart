import 'package:flutter/material.dart';
import 'package:viaje_express_app/models/solicitud_cliente.dart';
import 'package:viaje_express_app/models/usuario.dart';
import 'package:viaje_express_app/providers/cliente_providers/viaje_express_provider.dart';
class SolicitudesPage extends StatefulWidget {
   

  @override
  _SolicitudesPageState createState() => _SolicitudesPageState();
}

class _SolicitudesPageState extends State<SolicitudesPage> {
 final solicitudProvider= new ViajeProvider();
 Usuario usuario;
  @override
  Widget build(BuildContext context) {
  final  Usuario personaArgumento= ModalRoute.of(context).settings.arguments;
   if(personaArgumento!=null){
     usuario=personaArgumento;
   }
    return Scaffold(
       appBar: AppBar(
         title: Text('Mis solicitudes'),
       ),
       body: _crearListado(),
    );
  }
  Widget _crearListado(){
    return FutureBuilder(
      future: solicitudProvider.getSolicitudes(usuario.personaRolId),
      builder: (BuildContext context, AsyncSnapshot<List<SolicitudCliente>> snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i){
              return _crearItem(snapshot.data[i]);
            },
          );
        }else{
         
          print('no hhay');
           return Center(
             child: CircularProgressIndicator(),
           );
        }
      }
    );
  }
  Widget _crearItem(SolicitudCliente solicitud){
  if(solicitud.tipoSolicitudId==2){
    if(solicitud.estadoSolicitudId==2){
    return Card(
      child: ListTile(
        title: Text(
          '${solicitud.solicitudClienteSalidaSolCliente}-${solicitud.solicitudClienteDestinoSolCliente}'         
          ),
        
      subtitle: Text('Pediente', style: TextStyle( color: Colors.red)),
      selectedTileColor: Colors.white,
      leading:  Icon(Icons.local_taxi_outlined, color: Colors.red,),
      
      ) 
     );
    }else if(solicitud.estadoSolicitudId==1){
      return Card(
            child: ListTile(
              title: Text(
                '${solicitud.solicitudClienteSalidaSolCliente}-${solicitud.solicitudClienteDestinoSolCliente}'         
                ),
              
            subtitle: Text('Confirmada', style: TextStyle( color: Colors.green)),
            selectedTileColor: Colors.white,
            leading:  Icon(Icons.local_taxi_outlined, color: Colors.green,),
            
            ) 
          );
    }
  }
  else{
       if(solicitud.estadoSolicitudId==2){
    return Card(
      child: ListTile(
        title: Text(
          '${solicitud.solicitudClienteSalidaSolCliente}-${solicitud.solicitudClienteDestinoSolCliente}'         
          ),
        
      subtitle: Text('Pediente', style: TextStyle( color: Colors.red)),
      selectedTileColor: Colors.white,
      leading:  Icon(Icons.grid_view, color: Colors.red,),
      
      ) 
     );
    }else if(solicitud.estadoSolicitudId==1){
      return Card(
            child: ListTile(
              title: Text(
                '${solicitud.solicitudClienteSalidaSolCliente}-${solicitud.solicitudClienteDestinoSolCliente}'         
                ),
              
            subtitle: Text('Confirmada', style: TextStyle( color: Colors.green)),
            selectedTileColor: Colors.white,
            leading:  Icon(Icons.grid_view, color: Colors.green,),
            
            ) 
          );
    }
  }
}
}