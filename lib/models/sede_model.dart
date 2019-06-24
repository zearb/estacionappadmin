// To parse this JSON data, do
//
//     final sedeModel = sedeModelFromJson(jsonString);

import 'dart:convert';

SedeModel sedeModelFromJson(String str) => SedeModel.fromJson(json.decode(str));

String sedeModelToJson(SedeModel data) => json.encode(data.toJson());

class SedeModel {
    String id;
    String direccion;
    String distrito;
    int estadoSucursal;
    String idEmpresa;
    int verfPiso;
    int verfZona;

    SedeModel({
        this.id,
        this.direccion,
        this.distrito,
        this.estadoSucursal,
        this.idEmpresa,
        this.verfPiso,
        this.verfZona,
    });

    factory SedeModel.fromJson(Map<String, dynamic> json) => new SedeModel(
        id: json["id"],
        direccion: json["direccion"],
        distrito: json["distrito"],
        estadoSucursal: json["estadoSucursal"],
        idEmpresa: json["idEmpresa"],
        verfPiso: json["verfPiso"],
        verfZona: json["verfZona"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "direccion": direccion,
        "distrito": distrito,
        "estadoSucursal": estadoSucursal,
        "idEmpresa": idEmpresa,
        "verfPiso": verfPiso,
        "verfZona": verfZona,
    };
}