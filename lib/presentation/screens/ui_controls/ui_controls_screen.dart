import 'package:flutter/material.dart';

class UiControlsScreen extends StatefulWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  State<UiControlsScreen> createState() => _UiControlsScreenState();
}

class _UiControlsScreenState extends State<UiControlsScreen> {
  bool isDeveloper = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsViewState(),
    );
  }
}

class _UiControlsViewState extends StatefulWidget {
  const _UiControlsViewState({super.key});

  @override
  State<_UiControlsViewState> createState() => _UiControlsViewStateState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewStateState extends State<_UiControlsViewState> {
  Transportation selectedTransportation = Transportation.plane;
  bool isDelveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDelveloper,
          onChanged: (value) {
            setState(() {
              isDelveloper = !isDelveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por caroo'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Boat'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
            ),
          ],
        ),

        // TODO: por aqui
        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          subtitle: const Text('Pollito con papas'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Almuerzo?'),
          subtitle: const Text('Pollito con papas'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Cena?'),
          subtitle: const Text('Pollito con papas'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
