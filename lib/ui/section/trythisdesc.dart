import 'package:flutter/material.dart';

Widget trythisdesc(int index, List tittle, List images,List desc ,context) =>
    CustomScrollView(
      slivers: [
        SliverAppBar(
          // actions: [],
          toolbarHeight: 60,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 4.1, bottom: 15),
            title: Text(tittle[index],
              style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          //add background images
      background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images[index],),
                  fit: BoxFit.cover,
                   colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                ),
              ),
            ),
          ),
//
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height / 2,
        ),
        //
        SliverList(
          delegate: SliverChildListDelegate(
            [
          //
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child : const Text("The description of the recipie is as follows:",style: TextStyle(decoration: TextDecoration.none, fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black,),),
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
                      fontSize: 20,
                ),
              ),
              ),
              //
            ],
          ),
        ),
        //
      ],
    );