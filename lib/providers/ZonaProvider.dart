import 'dart:convert';

import 'package:estacionapp/providers/EmpresaProvider.dart';
import 'package:http/http.dart' as http;
import 'package:estacionapp/models/Zona_model.dart';

class ZonaProvider{

  final String _url = 'https://estacionapp-3e428.firebaseio.com';
  



  Future<List<ZonaModel>> cargarZona(String idSede) async{

    final url = '$_url/zona.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<ZonaModel> datosZona = new List();

    final empresaList = new EmpresaProvider().cargarEmpresa();

    final idEmpresa = await empresaList.then((erg)=>(erg[0].id));

    // final sedeList = new SedeProvider().cargarSede();
    // final idSede = await sedeList.then((erg) => (erg[0].id));

  

    // print(idEmpresa);
    
    

    // print(decodedData);    

    if(decodedData == null) return [];

    decodedData.forEach((id,zona){

      // print(id);
      // print(Zona['idEmpresa']);
      

      if(zona['idEmpresa'] == idEmpresa && zona['idSucursal'] == idSede){
        
        
        final zonaTemp = ZonaModel.fromJson(zona);
        zonaTemp.id = id;
        datosZona.add(zonaTemp);

      }

      

      

    });    

    // print(datosZona[0].nombreZona);

    return datosZona;
    // return [];

  }

  

}