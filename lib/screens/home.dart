import 'package:flutter/material.dart';
import 'package:pallicare/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            const Headline(
              text: "Pallicare",
              textColor: Colors.green,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Quote(text: "There is an end to cure, but no end to care"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            HomeButton(
              onPressed: () {},
              text: "Search for Facilites",
              color: Colors.white,
              backgroundColor: Colors.green,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            HomeButton(
              onPressed: () {},
              text: "Wiki",
              color: Colors.white,
              backgroundColor: Colors.green,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            HomeButton(
              onPressed: () {},
              text: "About",
              color: Colors.white,
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
