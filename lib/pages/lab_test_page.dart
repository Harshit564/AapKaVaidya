import 'package:aapkavaidya/widgets/ind_labtest_listTile.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class LabTest {
  final String imageUrl;
  final String labName;
  final String labDescription;
  final String webUrl;
  LabTest(this.labName,this.labDescription,this.webUrl,this.imageUrl);
}

class LabTestPage extends StatefulWidget {
  @override
  _LabTestPageState createState() => _LabTestPageState();
}

class _LabTestPageState extends State<LabTestPage> {

  static List<LabTest> name = [
    LabTest('Mike','lab1','https://www.houseofdiagnostics.com/online-reports/','assets/images/booksImage.jpeg'),
    LabTest('Todd','lab2','https://www.houseofdiagnostics.com/online-reports/','assets/images/booksImage.jpeg'),
    LabTest('Ahmad','lab3','https://www.houseofdiagnostics.com/online-reports/','assets/images/booksImage.jpeg'),
    LabTest('Anthony','lab4','https://www.houseofdiagnostics.com/online-reports/','assets/images/booksImage.jpeg'),
    LabTest('Annette','lab5','https://www.houseofdiagnostics.com/online-reports/','assets/images/booksImage.jpeg'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      appBar: new AppBar(
        title: new Text(
          'Lab Test',
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            final LabTest labTest = name[index];
            return IndLabTestTile(
              labTitle: labTest.labName,
              labDescription: labTest.labDescription,
              webUrl: labTest.webUrl,
              imageUrl: labTest.imageUrl,
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        tooltip: 'Search Lab Reports',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<LabTest>(
            items: name,
            searchLabel: 'Search Lab Reports',
            suggestion: Center(
              child: Text('Filter lab reports by name, description'),
            ),
            failure: Center(
              child: Text('No lab reports found :('),
            ),
            filter: (labtest) => [
              labtest.labName,
              labtest.labDescription,
              labtest.webUrl,
              labtest.imageUrl
            ],
            builder: (labtest) => IndLabTestTile(
              labTitle: labtest.labName,
              labDescription: labtest.labDescription,
              webUrl: labtest.webUrl,
              imageUrl: labtest.imageUrl,
            ),
          ),
        ),
        child: Icon(Icons.search,color: Colors.black,),
      ),
    );
  }
}
