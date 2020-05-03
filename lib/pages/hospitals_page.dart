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
    HospitalName('Aditya Hospitals','	4-1-16 Tilak Road Hyderabad 500 001 India','Allday',' + 91 40 475 2988','assets/images/booksImage.jpeg'),
    HospitalName('Agadi Hospital and Research Centre','Wilson Garden Bangalore India','Allday',' + 91 80 222 2925','assets/images/booksImage.jpeg'),
    HospitalName('Amar Leela Hospital','"B-1/6 Janakpuri-58 Delhi India"','Allday',' +91 11 553 7965','assets/images/booksImage.jpeg'),
    HospitalName('Apex Hospitals','"SP-6 Malviya Industrial Area Malviya Ngr 302017 Jaipur India"','Allday',' + 91 141 751 871','assets/images/booksImage.jpeg'),
    HospitalName('Bhagawan Mahaveer Jain Hospital','"Miller RoadMiller Road Vijaya Ngr Bangalore India"','Allday',' + 91 080 226 0944','assets/images/booksImage.jpeg'),
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
