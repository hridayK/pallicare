import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import '../models/facilitiy.dart';

class FacilityPage extends StatelessWidget {
  const FacilityPage({super.key, required this.facility});

  final Facility facility;
  final TextStyle textStyle = const TextStyle(
    color: Colors.black,
    fontSize: 26,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facility Details:"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ",
              style: textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              facility.name,
              style: textStyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "Address: ",
              style: textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              facility.address,
              style: textStyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "Website: ",
              style: textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              facility.website == "" ? "Not Avaialable" : facility.website,
              style: textStyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  final availableMaps = await MapLauncher.installedMaps;
                  print(availableMaps);
                  await availableMaps.first.showMarker(
                    coords: Coords(facility.lat, facility.long),
                    title: "Ocean Beach",
                  );
                },
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                child: const Text("Open in Maps"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
