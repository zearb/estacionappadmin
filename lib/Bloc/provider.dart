import 'package:estacionapp/Bloc/LoginBloc.dart';
export 'package:estacionapp/Bloc/LoginBloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget{

  final loginBloc = new LoginBloc();


  Provider({Key key, Widget child}):super(key:key,child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context){
    return(context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }

}