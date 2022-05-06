import 'package:flutter/material.dart';

Widget textFormFieldFormat(
        {@required validation,
        @required controller,
        @required label,
        ontap,
        @required prefix,
        suffix,
        @required keyboardType,
        bool obscure = false,
        onchange,
        suffixPressed}) =>
    TextFormField(
      onTap: ontap,
      onChanged: onchange,
      validator: validation,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      decoration: InputDecoration(
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: suffixPressed,
                )
              : null,
          labelText: label,
          border: OutlineInputBorder()),
    );

Widget divider() => Padding(
      padding: EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
