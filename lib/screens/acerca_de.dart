import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  static const routeName = '/acerca-de';

  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'HomeAlone (Mi Pobre Angelito)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Director: Chris Columbus',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Datos relevantes:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Duración: 1 horas 43 minutos',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Género: Infantil, Comedia, Aventura',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Fecha de estreno: 16 de noviembre de 1990',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Calificación: 7.7/10 (IMDb)',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
