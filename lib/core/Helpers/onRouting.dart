import 'dart:core';

import 'package:flutter/cupertino.dart';

extension Navigation on BuildContext{
 Future<dynamic>push(String route, {Object? args}){
   return Navigator.pushNamed(this, route,arguments: args);
 }


 Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
   return Navigator.of(this)
       .pushReplacementNamed(routeName, arguments: arguments);
 }

 Future<dynamic> pushNamedAndRemoveUntil(String routeName,
     {Object? arguments, required RoutePredicate predicate}) {
   return Navigator.of(this)
       .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
 }

 void pop() => Navigator.of(this).pop();
}
extension StringExtension on String?{
  bool isNullOrEmpty()=>this==null||this=="";
}
extension ListExtension<T> on List<T?>? {
  bool isNullOrEmpty()=>this==null||this!.isEmpty;
}