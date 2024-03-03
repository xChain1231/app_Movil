// ignore_for_file: unused_import, equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:homealone_movie_app/screens/portada.dart';
import 'package:homealone_movie_app/screens/personajes.dart';
import 'package:homealone_movie_app/screens/momentos.dart';
import 'package:homealone_movie_app/screens/acerca_de.dart';
import 'package:homealone_movie_app/screens/en_mi_vida_screen.dart';
import 'package:homealone_movie_app/screens/en_mi_vida_screen1.dart';
import 'package:homealone_movie_app/screens/contratame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Pobre Angelito',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Roboto',
      ),
      home: const InicioScreen(),
      routes: {
        PortadaScreen.routeName: (context) => PortadaScreen(),
        PersonajesScreen.routeName: (context) => PersonajesScreen(),
        MomentosFavoritosScreen.routeName: (context) =>
            const MomentosFavoritosScreen(),
        AcercaDeScreen.routeName: (context) => const AcercaDeScreen(),
        EnMiVidaScreen.routeName: (context) => const EnMiVidaScreen(),
        EnMiVidaScreen2.routeName: (context) => const EnMiVidaScreen2(),
        ContratameScreen.routeName: (context) => const ContratameScreen(),
      },
    );
  }
}

class InicioScreen extends StatefulWidget {
  const InicioScreen() : super(key: const Key('InicioScreenKey'));

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    PortadaScreen(),
    PersonajesScreen(),
    const MomentosFavoritosScreen(),
    const AcercaDeScreen(),
    const EnMiVidaScreen(),
    const EnMiVidaScreen2(),
    const ContratameScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getScreenTitle(_selectedIndex)),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: _screens.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text(
                  'Mi Pobre Angelito (HomeAlone)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
            }
            final screenIndex = index - 1;
            return ListTile(
              title: Text(_getScreenTitle(screenIndex)),
              onTap: () {
                setState(() {
                  _selectedIndex = screenIndex;
                });
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: _selectedIndex == 0
          ? _buildInicioContent()
          : _screens[_selectedIndex - 1],
    );
  }

  String _getScreenTitle(int index) {
    switch (index) {
      case 0:
        return 'Inicio';
      case 1:
        return 'Portada';
      case 2:
        return 'Personajes';
      case 3:
        return 'Momentos Favoritos';
      case 4:
        return 'Acerca de';
      case 5:
        return 'En Mi Vida';
      case 6:
        return 'Contrátame';
      default:
        return '';
    }
  }

  Widget _buildInicioContent() {
    return Center(
      child: Image.asset('assets/images/portada.jpg'),
    );
  }
}
