import 'package:doctordiagnose/data/data.dart';
import 'package:doctordiagnose/screens/diagnose_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Diagnose",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                final scenario = medicalScenarios[index];
                return GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DiagnoseScreen()))
                  },
                  child: Card(
                      color: const Color(0xFF252525),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 18,
                          ),
                          SizedBox(
                            width: 80,
                            child: Image(
                              image:
                                  AssetImage('assets/avatars/avatar$index.png'),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Center(
                              child: Text(
                                'Symptoms: ${scenario['symptom']}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      )),
                );
              }),
        ),
      ),
    );
  }
}
