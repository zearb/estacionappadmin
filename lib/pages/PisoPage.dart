import 'package:estacionapp/models/empresa_model.dart';
import 'package:estacionapp/models/piso_model.dart';
import 'package:estacionapp/providers/EmpresaProvider.dart';
import 'package:estacionapp/providers/PisoProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PisoPage extends StatelessWidget{

  
  final empresaProvider = new EmpresaProvider();
  final pisoProvider = new PisoProvider();


  @override
  Widget build(BuildContext context) {


    // print(idPiso);

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
        child: _listaPisos(context)
      )
        );
    }

  Widget _nombreEmpresa() {


    return FutureBuilder(
      future: empresaProvider.cargarEmpresa(),
      builder: (BuildContext context,AsyncSnapshot<List<EmpresaModel>> snapshot){
        if(snapshot.hasData){

          final empresa = snapshot.data;
          
          return Text('${empresa[0].nomEmpresa} - Seleccione la Piso:');
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
    
    // return 
  }

  Widget _listaPisos(BuildContext context) {

    
    final String idZona = ModalRoute.of(context).settings.arguments;
    
    return FutureBuilder(
      future: pisoProvider.cargarPiso(idZona),
      builder: (BuildContext context,AsyncSnapshot<List<PisoModel>> snapshot){

  
        if(snapshot.hasData){



          final piso = snapshot.data;
          
          // if(sede.where((f)=>f.idEmpresa()));

          return ListView.builder(
            itemCount: piso.length,
            itemBuilder: (context,i) => _crearItemPiso(context,piso[i]),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }

    );

  }


  Widget _crearItemPiso(BuildContext context,PisoModel piso){
    
    return Card(
      color: Color.fromRGBO(73, 73, 81, 1),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(20.0),
            leading: Icon(Icons.location_on,color: Colors.blueAccent,),
            title: Text('${piso.nombrePiso}',style: TextStyle(color: Colors.white, fontSize:25.0),),
                  subtitle: Text('Estado: ${piso.estadoPiso}',style: TextStyle(color: Colors.white,fontSize: 15.0),textAlign: TextAlign.end,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Gestionar'),
                onPressed: ()=>Navigator.pushNamed(context, 'espacio' , arguments: piso.id),
              )
            ],
          )
        ],
        ),
    );


  }


       }
          
