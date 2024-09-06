import 'package:flutter/material.dart';
import 'package:todo/database.dart';
import 'package:todo/utils/imageConstants.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            Image(image: AssetImage(Imageconstants.aboutUsImage)),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: List.generate(
                      Database.aboutUsList.length,
                      (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.justify,
                              Database.aboutUsList[index]['title'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(Database.aboutUsList[index]['subtitle']),
                            SizedBox(
                              height: 10,
                            )
                          ]),
                    ),
                  ),
                  Text(
                    'Links',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(Imageconstants.instagramImage),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 10),
                      Text('@_wandering_b.o.y_')
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Imageconstants.gitHubImage),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 10),
                      Text('@sujith8806')
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Imageconstants.linkedin),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 10),
                      Text('Sujith S')
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
