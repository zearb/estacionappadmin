// To parse this JSON data, do
//
//     final pisoModel = pisoModelFromJson(jsonString);

import 'dart:convert';

PisoModel pisoModelFromJson(String str) => PisoModel.fromJson(json.decode(str));

String pisoModelToJson(PisoModel data) => json.encode(data.toJson());

class PisoModel {
    String id;
    int estadoPiso;
    String idZona;
    String nombrePiso;

    PisoModel({
        this.id,
        this.estadoPiso,
        this.idZona,
        this.nombrePiso,
    });

    factory PisoModel.fromJson(Map<String, dynamic> json) => new PisoModel(
        id: json["id"],
        estadoPiso: json["estadoPiso"],
        idZona: json["idZona"],
        nombrePiso: json["nombrePiso"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "estadoPiso": estadoPiso,
        "idZona": idZona,
        "nombrePiso": nombrePiso,
    };
}
