import 'package:flutter/material.dart';

navigate( {required BuildContext context,required String route,bool replacement = false}) 
{
  if (replacement == true) 
  {
    Navigator.pushReplacementNamed(context, route);
  } else
   {
    Navigator.pushNamed(context,route);
  }
}
