import 'package:flutter/material.dart';
import 'package:r01recipieapp/ui/section/trythisdesc.dart';

Widget buildcard1(int index, List tittle, List images,List desc, context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.shade400,
        ),
        child: Column(
          children: [
            ////
            ////
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(images[index]), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  color: Colors.blue.shade400,
                  child: Ink.image(
                    image: NetworkImage(
                      images[index],
                    ),
                    ////
                    //////
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (comtext) =>
                                    trythisdesc(index, tittle, images,desc,context)));
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              height: 50,
              child: Row(
                children: [
                  Text(
                    '$index',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    tittle[index],
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
