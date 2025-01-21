import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//ignore_for_file: avoid_print
/// Interface for creating different types of markers
abstract class MarkerFactory {
  Marker createMarker(LatLng position);
}

/// Factory for creating default markers
class DefaultMarkerFactory implements MarkerFactory {
  @override
  Marker createMarker(LatLng position) {
    return Marker(
      markerId: MarkerId(position.toString()),
      position: position,
      infoWindow: InfoWindow(title: 'Default Marker'),
    );
  }
}

/// Factory for creating custom markers with icons
class CustomMarkerFactory implements MarkerFactory {
  VoidCallback onTap;

  CustomMarkerFactory(this.onTap);

  @override
  Marker createMarker(LatLng position) {
    return Marker(
      markerId: MarkerId(position.toString()),
      position: position,
      onTap: onTap,
      infoWindow: InfoWindow(title: 'Custom Marker'),
    );
  }
}

/// Example usage
void main() {
  // Create a default marker factory
  MarkerFactory defaultFactory = DefaultMarkerFactory();
  Marker defaultMarker = defaultFactory.createMarker(LatLng(37.422, -122.084));

  // Create a custom marker factory
  MarkerFactory customFactory = CustomMarkerFactory(() {
    print('Custom marker tapped');
  });
  Marker customMarker = customFactory.createMarker(LatLng(37.422, -122.084));
}

/// Interface for creating different types of buttons
abstract class ButtonFactory {
  Widget createButton(String text, VoidCallback onPressed);
}

/// Factory for creating standard ElevatedButton
class ElevatedButtonFactory implements ButtonFactory {
  @override
  Widget createButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

/// Factory for creating an outlined button
class OutlinedButtonFactory implements ButtonFactory {
  @override
  Widget createButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

/// Factory for creating a text button
class TextButtonFactory implements ButtonFactory {
  @override
  Widget createButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

/// Example usage
class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Create different button factories
    ButtonFactory elevatedButtonFactory = ElevatedButtonFactory();
    ButtonFactory outlinedButtonFactory = OutlinedButtonFactory();
    ButtonFactory textButtonFactory = TextButtonFactory();

    return Column(
      children: [
        elevatedButtonFactory.createButton('Elevated Button', () {
          // Handle button press
          print('Elevated Button Pressed');
        }),
        outlinedButtonFactory.createButton('Outlined Button', () {
          // Handle button press
          print('Outlined Button Pressed');
        }),
        textButtonFactory.createButton('Text Button', () {
          // Handle button press
          print('Text Button Pressed');
        }),
      ],
    );
  }
}
