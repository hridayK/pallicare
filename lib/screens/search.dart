import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:pallicare/models/facilitiy.dart';
import 'package:pallicare/services/services.dart';
import 'package:pallicare/widgets/search_widgets.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Future<String> data;
  late List<String> dataList;
  late String data1;
  TextEditingController searchController = TextEditingController();
  List<Facility> results = [];
  List<Facility> objectList = [];

  getData() async {
    String response = await loadAsset();
    return response;
  }

  void updateData(String value) {
    setState(() {
      results = objectList
          .where(
              (element) => element.searchContent.toLowerCase().contains(value))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    data = loadAsset();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Facilities"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: data,
        initialData: "",
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<List<dynamic>> listData =
              const CsvToListConverter().convert(snapshot.data!);

          List<Facility> facilities = sendModelList(parsedData: listData);
          objectList = facilities;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                ),
                child: TextField(
                  // controller: searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Search for Facilities",
                  ),
                  onChanged: (value) {
                    updateData(value);
                  },
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.grey.shade300),
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(
                      MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                  textStyle: const MaterialStatePropertyAll(
                    TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                child: const Text("Get Nearest Facilities"),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return SearchResult(facility: results[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
