import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practicaclase/presentation/provider/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.user),
        actions:[
          IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            context.goNamed('login');
          },
        ),
        ] 
      ),
      body:  Center(
        child: Text( "Bienvenido " + provider.user,
          style: const TextStyle(fontSize: 24, ),
        ),
        
        
      ),
    );
  }
}