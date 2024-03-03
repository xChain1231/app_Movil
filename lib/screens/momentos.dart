// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MomentosFavoritosScreen extends StatelessWidget {
  static const routeName = '/momentos-favoritos';

  static const List<Map<String, String>> _momentos = [
    {
      'titulo': 'Se le quema la cabeza a Harry Lyme',
      'imagen': 'assets/images/firehead.gif',
      'detalle': 'En esta escena harry'
          ' consigue abrir la puerta principal,, '
          'pero Kevin (Macaulay Culkin) le ha puesto un soplete que se activa al abrir la puerta. '
          'El ladrón se quema la cabeza..',
      'videoUrl': 'https://www.youtube.com/watch?v=0E78h2hYFOg',
    },
    {
      'titulo': 'Marv Pisa un clavo',
      'imagen': 'assets/images/marvnail.gif',
      'detalle': 'En esta parte de la película, Marv esta dentro de la casa'
          'pero este no se esperaba que el piso estuviera lleno de pegatina'
          'y tuviera un clavo ',
      'videoUrl': 'https://www.youtube.com/watch?v=AaooFastSrg',
    },
    {},
  ];

  const MomentosFavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _momentos.length,
        itemBuilder: (ctx, index) {
          // Verificar si el mapa en el índice actual está vacío
          if (_momentos[index].isEmpty) {
            return Container(); // Devolver un contenedor vacío si está vacío
          }

          return Column(
            children: [
              Center(
                child: ListTile(
                  leading: Image.asset(
                    _momentos[index]['imagen']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(_momentos[index]['titulo']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text(_momentos[index]['titulo']!),
                          ),
                          body: Column(
                            children: [
                              Image.asset(_momentos[index]['imagen']!),
                              const SizedBox(height: 16),
                              Text(
                                _momentos[index]['detalle']!,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  _launchURL(_momentos[index]['videoUrl']!);
                                },
                                child: const Text('Ver video'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(thickness: 2, height: 2),
            ],
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}
