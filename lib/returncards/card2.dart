import 'package:flutter/material.dart';
import 'package:r01recipieapp/ui/section/allmealsdesc.dart';

Widget buildcard2(int index, List tittle, String images, List desc, context) =>
    Scaffold(
      //
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              //
              decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.themealdb.com/images/ingredients/$images.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
              //
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => allmealdesc(index, tittle, images,desc,context),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -5,
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 45,
                child: Row(
                  children: [
                    Text(
                      '$index',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      tittle[index],
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
