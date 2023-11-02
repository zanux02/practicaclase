import 'package:flutter/material.dart';
import 'package:practicaclase/config/router/app_router.dart';
import 'package:practicaclase/config/theme/app_theme.dart';
import 'package:practicaclase/presentation/provider/provider.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider() )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 4).getTheme(),
      ),
    );
  }
}