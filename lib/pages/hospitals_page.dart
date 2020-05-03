import 'package:aapkavaidya/widgets/ind_hospitals_listTile.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class HospitalName {
  final String imageUrl;
  final String name;
  final String location;
  final String specialization;
  final String availability;
  HospitalName(this.name,this.location,this.availability,this.specialization,this.imageUrl);
}

class HospitalsPage extends StatefulWidget {
  static const String routeName = "/hospitals-page";

  @override
  _HospitalsPageState createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
  static List<HospitalName> name = [
    HospitalName('Mike','sasf','asf','asf','assets/images/booksImage.jpeg'),
    HospitalName('Todd','ffs','at','dg','assets/images/booksImage.jpeg'),
    HospitalName('Ahmad','sdd','seg','sgsf','assets/images/booksImage.jpeg'),
    HospitalName('Anthony','dfh','dfg','dfgbdf','assets/images/booksImage.jpeg'),
    HospitalName('Annette','dfbs','rhy','uytk','assets/images/booksImage.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      appBar: new AppBar(
        title: new Text(
          'Hospitals',
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
            final HospitalName hospitalName = name[index];
            return IndHospitalListTile(
              name: hospitalName.name,
              location: hospitalName.location,
              specialization: hospitalName.specialization,
              availability: hospitalName.availability,
              imageUrl: hospitalName.imageUrl,
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        tooltip: 'Search Hospitals',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<HospitalName>(
            items: name,
            searchLabel: 'Search people',
            suggestion: Center(
              child: Text('Filter people by name, surname or age'),
            ),
            failure: Center(
              child: Text('No person found :('),
            ),
            filter: (hospital) => [
              hospital.name,
              hospital.availability,
              hospital.imageUrl,
              hospital.specialization,
              hospital.location
            ],
            builder: (hospital) => IndHospitalListTile(
              name: hospital.name,
              location: hospital.location,
              specialization: hospital.specialization,
              availability: hospital.availability,
              imageUrl: hospital.imageUrl,
            ),
          ),
        ),
        child: Icon(Icons.search,color: Colors.black,),
      ),
    );
  }
}
