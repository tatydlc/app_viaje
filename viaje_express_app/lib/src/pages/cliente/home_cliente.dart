import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viaje_express_app/models/usuario.dart';
class ClientePage extends StatefulWidget {


  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  Usuario usuario = new Usuario();
  @override
  Widget build(BuildContext context) {
   final  Usuario personaArgumento= ModalRoute.of(context).settings.arguments;
   if(personaArgumento!=null){
     usuario=personaArgumento;
   }
   return Scaffold(
       appBar: AppBar(
         title: Text('Bienvenid@ ${usuario.personaNombreUsuario}'),
       ),
       body: Container(
      
        padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 80.0,
            width: 80.0,
            child: _offsetPopup()
          )
        )
      )
    );
  }

 Widget _offsetPopup() => PopupMenuButton<int>(
    itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Row(
              children: <Widget>[
                Icon(Icons.local_taxi_outlined),
                CupertinoButton(child:  Text(
                "Viaje express",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),     
                
                ), onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'transporte_cliente', arguments: usuario);
                })    
               ]             
            ),
            
          ),
          PopupMenuItem(
            value: 2,
            
           child: Row(
              children: <Widget>[
                Icon(Icons.grid_view),
                CupertinoButton(child:  Text(
                "Enviar un paquete",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),     
                ), onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'transporte_cliente', arguments: usuario);
                })    
               ]             
            ),
            
          ),
           PopupMenuItem(
            value: 3,
            child: Row(
              children: <Widget>[
                Icon(Icons.format_list_numbered_rounded),
                CupertinoButton(child:  Text(
                "Mis Solicitudes",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),     
                ), onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'solicitudes_cliente', arguments: usuario);
                })    
               ]             
            ),
          ),
           PopupMenuItem(
            value: 4,
            child: Row(
              children: <Widget>[
                Icon(Icons.subdirectory_arrow_right_outlined),
                CupertinoButton(child:  Text(
                "Rutas disponibles",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),     
                ), onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'rutas_cliente', arguments: usuario);
                })    
               ]             
            ),
          ),
        ],
    icon: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.blue,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white, width: 2),
          
        ),
        
      ),
      child: Icon(Icons.add,color: Colors.white,),
      //child: Icon(Icons.menu, color: Colors.white), <-- You can give your icon here
    ),
  
  );
}