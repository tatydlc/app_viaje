
import 'dart:convert';

List<Ruta> rutaFromJson(String str) => List<Ruta>.from(json.decode(str).map((x) => Ruta.fromJson(x)));

String rutaToJson(List<Ruta> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ruta {
    Ruta({
        this.rutaId,
        this.cooperativaId,
        this.salidaId,
        this.destinoId,
        this.rutaFecha,
       
        this.rutaMonto
    });

    int rutaId;
    int cooperativaId;
    int salidaId;
    int destinoId;
    String rutaFecha;
   
    int rutaMonto;


    factory Ruta.fromJson(Map<String, dynamic> json) => Ruta(
        rutaId: json["rutaId"],
        cooperativaId: json["cooperativaId"],
        salidaId: json["salidaId"],
        destinoId: json["destinoId"],
        rutaFecha: json["rutaFecha"],
      
        rutaMonto: json["rutaMonto"],
    );

    Map<String, dynamic> toJson() => {
        "rutaId": rutaId,
        "cooperativaId": cooperativaId,
        "salidaId": salidaId,
        "destinoId": destinoId,
        "rutaFecha": rutaFecha,
        
        "rutaMonto": rutaMonto,
    };
}
