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
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  color: const Color(0xFF252525),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Image(
                          image: AssetImage(
                              'assets/avatars/avatar${index + 1}.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text("Problem 1"),
                        ),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}
