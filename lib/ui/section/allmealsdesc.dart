import 'package:flutter/material.dart';

Widget allmealdesc(int index, List tittle, String images, List desc, context) =>
  CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 60,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 4.1, bottom: 15),
            title: Text(
              tittle[index],
              style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            //
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.themealdb.com/images/ingredients/$images.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                ),
              ),
            ),
            //
            //
          ),
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height / 2,
        ),
        //
        //
        SliverList(
        
          delegate: SliverChildListDelegate(
            
            [
              //
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "The description of the recipie is as follows:",
                  style: TextStyle(

                    decoration: TextDecoration.none,
                    color: Colors.black,

                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                ),
              ),
              //
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Text(
                  desc[index],
                  style: const TextStyle(
                     decoration: TextDecoration.none,
                     color: Colors.black,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              //
              //
            ],
          ),
        ),
        //
        //
      ],
    );
