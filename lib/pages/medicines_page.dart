import 'package:aapkavaidya/widgets/ind_medicines_listTile.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class MedicineName {
  final String imageUrl;
  final String name;
  final String uses;
  final String precaution;
  final String availability;
  MedicineName(this.name,this.uses,this.availability,this.precaution,this.imageUrl);
}

class MedicinesPage extends StatefulWidget {
  static const String routeName = "/medicines-page";

  @override
  _MedicinesPageState createState() => _MedicinesPageState();
}

class _MedicinesPageState extends State<MedicinesPage> {

  static List<MedicineName> name = [
    MedicineName('Mike','sasf','asf','asf','assets/images/booksImage.jpeg'),
    MedicineName('Todd','ffs','at','dg','assets/images/booksImage.jpeg'),
    MedicineName('Ahmad','sdd','seg','sgsf','assets/images/booksImage.jpeg'),
    MedicineName('Anthony','dfh','dfg','dfgbdf','assets/images/booksImage.jpeg'),
    MedicineName('Annette','dfbs','rhy','uytk','assets/images/booksImage.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      appBar: new AppBar(
        title: new Text(
          'Medicines',
          style: TextStyle(
            color: Colors.greenAccent,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            final MedicineName medicineName = name[index];
            return IndMedicineListTile(
              name: medicineName.name,
              availability: medicineName.availability,
              imageUrl: medicineName.imageUrl,
              uses: medicineName.uses,
              precaution: medicineName.precaution ,
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        tooltip: 'Search Hospitals',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<MedicineName>(
            items: name,
            searchLabel: 'Search people',
            suggestion: Center(
              child: Text('Filter people by name, surname or age'),
            ),
            failure: Center(
              child: Text('No person found :('),
            ),
            filter: (medicine) => [
              medicine.name,
              medicine.availability,
              medicine.imageUrl,
              medicine.uses,
              medicine.precaution,
            ],
            builder: (medicine) => IndMedicineListTile(
              name: medicine.name,
              uses: medicine.uses,
              precaution: medicine.precaution,
              availability: medicine.availability,
              imageUrl: medicine.imageUrl,
            ),
          ),
        ),
        child: Icon(Icons.search,color: Colors.black,),
      ),
    );
  }
}