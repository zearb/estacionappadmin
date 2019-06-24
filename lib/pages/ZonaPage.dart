import 'package:estacionapp/models/Zona_model.dart';
import 'package:estacionapp/models/empresa_model.dart';
import 'package:estacionapp/providers/EmpresaProvider.dart';
import 'package:estacionapp/providers/ZonaProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ZonaPage extends StatelessWidget{

  
  final empresaProvider = new EmpresaProvider();
  final zonaProvider = new ZonaProvider();


  @override
  Widget build(BuildContext context) {


    // print(idZona);

    Color color1 = Color.fromRGBO(249, 170, 51, 1);
    Color color2 = Color.fromRGBO(73, 101, 113, 1);


    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.directions_car,size: 45.0,)
          ),
        title: _nombreEmpresa(),
        backgroundColor: color1,
      ),
      body: Container(
        color: color2,
        padding: EdgeInsets.all(10.0),
        child: _listaZonas(context)
      )
        );
    }

  Widget _nombreEmpresa() {


    return FutureBuilder(
      future: empresaProvider.cargarEmpresa(),
      builder: (BuildContext context,AsyncSnapshot<List<EmpresaModel>> snapshot){
        if(snapshot.hasData){

          final empresa = snapshot.data;
          
          return Text('${empresa[0].nomEmpresa} - Seleccione la zona:');
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
    
    // return 
  }

  Widget _listaZonas(BuildContext context) {

    
    final String idSede = ModalRoute.of(context).settings.arguments;
    
    return FutureBuilder(
      future: zonaProvider.cargarZona(idSede),
      builder: (BuildContext context,AsyncSnapshot<List<ZonaModel>> snapshot){

  
        if(snapshot.hasData){



          final zona = snapshot.data;
          
          // if(sede.where((f)=>f.idEmpresa()));

          return ListView.builder(
            itemCount: zona.length,
            itemBuilder: (context,i) => _crearItemZona(context,zona[i]),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }

    );

  }


  Widget _crearItemZona(BuildContext context,ZonaModel zona){
    
    return Card(
      color: Color.fromRGBO(73, 73, 81, 1),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(20.0),
            leading: Icon(Icons.location_on,color: Colors.blueAccent,),
            title: Text('${zona.nombreZona}',style: TextStyle(color: Colors.white, fontSize:25.0),),
                  subtitle: Text('Estado: ${zona.estadoZona}',style: TextStyle(color: Colors.white,fontSize: 15.0),textAlign: TextAlign.end,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Gestionar'),
                onPressed: ()=>Navigator.pushNamed(context, 'piso',arguments: zona.id),
              )
            ],
          )
        ],
        ),
    );


  }


       }
          
