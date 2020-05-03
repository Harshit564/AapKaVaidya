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
    MedicineName('Bacitracin ','For the treatment of superficial ocular infections involving the conjunctiva and/or cornea caused by Bacitracin susceptible organisms.','Low','Bacitracin ophthalmic ointment should not be used in deep-seated ocular infections or in those that are likely to become systemic. The prolonged use of antibiotic containing preparations may result in overgrowth of nonsusceptible organisms particularly fungi. If new infections develop during treatment appropriate antibiotic or chemotherapy should be instituted.','assets/images/booksImage.jpeg'),
    MedicineName('Bactroban ','Bactroban topical (for use on the skin) is used to treat skin infections such as impetigo or a "Staph" infection of the skin.','High','Antibiotic medicines can cause diarrhea, which may be a sign of a new infection. If you have diarrhea that is watery or bloody, call your doctor. Do not use anti-diarrhea medicine unless your doctor tells you to.','assets/images/booksImage.jpeg'),
    MedicineName('Gemfibrozil ','It is used to decrease a person’s risk of pancreatitis when triglyceride levels are very high. It is also used to decrease the risk of heart disease in certain patients with high cholesterol','Low','Follow the diet recommended by your doctor. Gemfibrozil will not be as effective in lowering your cholesterol if you do not follow a cholesterol-lowering diet plan.','assets/images/booksImage.jpeg'),
    MedicineName('Namenda','Namenda (memantine) reduces the actions of chemicals in the brain that may contribute to the symptoms of Alzheimer disease.','Moderate','Namenda can cause side effects that may impair your thinking or reactions. Be careful if you drive or do anything that requires you to be awake and alert.','assets/images/booksImage.jpeg'),
    MedicineName('Norflex','Norflex is used together with rest and physical therapy to treat skeletal muscle conditions such as pain or injury.','High','Do not drink alcohol. Dangerous side effects or death can occur.','assets/images/booksImage.jpeg'),
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