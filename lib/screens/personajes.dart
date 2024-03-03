// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class PersonajesScreen extends StatelessWidget {
  static const routeName = '/personajes';

  static const List<Map<String, String>> _personajes = [
    {
      'nombre': 'Kevin McCallister',
      'imagen': 'assets/images/kevin.jpg',
      'descripcion': 'Personaje Principal De La Pelicula. '
          'Fue separado por error de su familia durante la Navidad dos veces cuando era niño'
          'se vio obligado a defenderse de los torpes ladrones Marv y Harry '
    },
    {
      'nombre': 'Harry Lyme',
      'imagen': 'assets/images/harry.jpg',
      'descripcion': 'Antagonistas'
          'era un ladrón que, junto con Marv Murchins , formando los " Wet Bandits "'
          'vio sus planes frustrados dos veces por Kevin McCallister'
    },
    {
      'nombre': 'Marv Murchins',
      'imagen': 'assets/images/marv.jpg',
      'descripcion': 'Antoginista'
          'Era un delincuente que se asociaba regularmente con Harry Lyme ,'
          'formando los " Wet Bandits ", un nombre derivado de su "tarjeta de presentación"'
          'de dejar correr el agua de sus víctimas y más tarde, los "Sticky Bandits"'
    },
  ];

  PersonajesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _personajes.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(_personajes[index]['imagen']!),
                ),
                title: Text(_personajes[index]['nombre']!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetallesPersonajeScreen(
                        nombre: _personajes[index]['nombre']!,
                        imagen: _personajes[index]['imagen']!,
                        descripcion: _personajes[index]['descripcion']!,
                      ),
                    ),
                  );
                },
              ),
              const Divider(thickness: 2, height: 2),
            ],
          );
        },
      ),
    );
  }
}

class DetallesPersonajeScreen extends StatelessWidget {
  final String nombre;
  final String imagen;
  final String descripcion;

  const DetallesPersonajeScreen({
    Key? key,
    required this.nombre,
    required this.imagen,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: Column(
        children: [
          Image.asset(imagen),
          const SizedBox(height: 16),
          Text(
            descripcion,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
