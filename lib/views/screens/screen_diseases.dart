import 'package:CareNow/helpers/constants.dart';
import 'package:CareNow/helpers/disease_list.dart';
import 'package:CareNow/views/screens/screen_disease_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ScreenDiseases extends StatefulWidget {
  const ScreenDiseases({Key? key}) : super(key: key);

  @override
  _ScreenDiseasesState createState() => _ScreenDiseasesState();
}

class _ScreenDiseasesState extends State<ScreenDiseases> {
  late List<Disease> filteredDiseases;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDiseases = diseaseList;
    searchController.addListener(filterDiseases);
  }

  void filterDiseases() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredDiseases = diseaseList
          .where((disease) => disease.diseaseName.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text(
          "Diseases",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search by disease name...",
                prefixIcon: Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: MyColor.redColor
                  )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                    color: MyColor.redColor
                  )
                )
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDiseases.length,
              itemBuilder: (BuildContext context, int index) {
                Disease disease = filteredDiseases[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(ScreenDiseaseResult(disease: disease));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                    padding: EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.07),
                        ),
                      ],
                    ),
                    child: Text(
                      disease.diseaseName,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
