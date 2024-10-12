import 'package:flutter/material.dart';


pushto(BuildContext context, Widget view){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => view));
}

pushWithReplacment(BuildContext context, Widget view){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => view));
}