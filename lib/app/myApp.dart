import 'package:agenda/app/views/contactlist_Page.dart';
import 'package:flutter/material.dart';
import 'package:agenda/app/routes/routes.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactList(),
      initialRoute: "/",
      onGenerateRoute: Rotas.gerarRotas,
    );
  }
}
