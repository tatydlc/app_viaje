import 'package:flutter/material.dart';
import 'package:viaje_express_app/models/ruta.dart';
import 'package:viaje_express_app/providers/cliente_providers/rutas_provider.dart';
class RutasPage extends StatefulWidget {

  @override
  _RutasPageState createState() => _RutasPageState();
}

class _RutasPageState extends State<RutasPage> {
  RutasProvider rutasProvider= new RutasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Rutas disponibles'),
       ),
       body: _crearListado(),
    );
  }
   Widget _crearListado(){
    return FutureBuilder(
      future: rutasProvider.getRutas(),
      builder: (BuildContext context, AsyncSnapshot<List<Ruta>> snapshot){
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
   Widget _crearItem(Ruta ruta){
  
    return Card(
      child: ListTile(
        title: Text('${ruta.rutaFecha}-${ruta.rutaMonto}'),
      subtitle: Text('Ruta'),
      trailing: PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: ListTile(
                    leading: Icon(Icons.fact_check_outlined), title: Text('Agendar')),
              value: 'agendar',
            )
          ];
        },
      )
      ) 
    );
  }
  
}