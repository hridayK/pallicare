import 'package:flutter/material.dart';
import 'package:pallicare/models/facilitiy.dart';
import 'package:pallicare/screens/searchResult.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.facility});

  final Facility facility;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        top: 2.5,
        bottom: 2.5,
      ),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FacilityPage(facility: facility),
              ),
            );
          },
          splashColor: Colors.blueGrey,
          highlightColor: Colors.blueGrey.shade200,
          child: Ink(
            padding: const EdgeInsets.all(10.0),
            color: Colors.blueGrey.shade50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        facility.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        facility.address.trim(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
