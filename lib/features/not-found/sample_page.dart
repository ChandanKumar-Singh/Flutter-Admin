import 'package:admin/core/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/index.dart';

class SampleFeaturePage extends StatelessWidget {
  const SampleFeaturePage({super.key, this.shell = false});
  final bool shell;

  @override
  Widget build(BuildContext context) {
    var currentRoute = context.watch<RouteState>().currentRoute;
    return Scaffold(
      appBar: shell
          ? null
          : AppBar(
              title: const Text('Sample Feature Page'),
            ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(20),
          children: [
            const HeaderText('Feature Under Construction'),
            TitleText('Current Route: $currentRoute'),
            MainCard(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter your name',
                      hintText: 'John Doe',
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(value: '1', child: Text('Item 1')),
                      DropdownMenuItem(value: '2', child: Text('Item 2')),
                    ],
                    isExpanded: true,
                    onChanged: (value) {},
                    alignment: AlignmentDirectional.bottomCenter,
                  ),
                ],
              ),
            ),
            const ColorDropdown(),
            const SizedBox(height: 20),
            const ColorDropdown(),
            const SizedBox(height: 20),
            const ColorDropdown(),
            const SizedBox(height: 20),
            const ColorDropdown(),
            const SizedBox(height: 20),
            const ColorDropdown(),
            const SizedBox(height: 20),
            const ColorDropdown(),
            const SizedBox(height: 20),
            const Icon(
              Icons.build,
              size: 100,
              color: Colors.orange,
            ),
            const SizedBox(height: 20),
            const Text(
              'This feature is currently under construction.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are working hard to bring you this feature. Stay tuned!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Home or another default page
                RouteUtils.goBack(); // Navigate back
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorDropdown extends StatefulWidget {
  const ColorDropdown({super.key});

  @override
  _ColorDropdownState createState() => _ColorDropdownState();
}

class _ColorDropdownState extends State<ColorDropdown> {
  String? selectedColor; // Store the selected color

  // List of colors
  final List<Map<String, Color>> colors = [
    {'Red': Colors.red},
    {'Green': Colors.green},
    {'Blue': Colors.blue},
    {'Yellow': Colors.yellow},
    {'Purple': Colors.purple},
    {'Orange': Colors.orange},
    {'Pink': Colors.pink},
    {'Cyan': Colors.cyan},
    {'Teal': Colors.teal},
    {'Brown': Colors.brown},
    {'Grey': Colors.grey},
    {'Black': Colors.black},
    {'White': Colors.white},
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedColor,
      hint: const Text('Select a color'),
      items: colors.map((Map<String, Color> colorMap) {
        return DropdownMenuItem<String>(
          value: colorMap.keys.first,
          child: Row(
            children: [
              const SizedBox(width: 5),
              Container(width: 20, height: 20, color: colorMap.values.first),
              const SizedBox(width: 10),
              Text(colorMap.keys.first),
            ],
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedColor = newValue; // Update the selected color
        });
      },
      icon: const Icon(Icons.arrow_drop_down),
      underline: Container(
          height: 2,
          color: colors
              .firstWhere(
                (element) => element.keys.first == selectedColor,
                orElse: () => {'': Colors.transparent},
              )
              .values
              .first),
      style: const TextStyle(color: Colors.black, fontSize: 16),
      dropdownColor: Colors.white,
      elevation: 16,
      isExpanded: true, // Make the dropdown expand to fit the parent
    );
  }
}
