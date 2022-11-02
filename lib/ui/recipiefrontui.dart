import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:r01recipieapp/returncards/card1.dart';
import 'package:r01recipieapp/returncards/card2.dart';
import 'package:http/http.dart' as http;

class RecipieFrontUi extends StatefulWidget {
  const RecipieFrontUi({Key? key}) : super(key: key);

  @override
  State<RecipieFrontUi> createState() => _RecipieFrontUiState();
}

class _RecipieFrontUiState extends State<RecipieFrontUi> {
  
  var fullresponsecategories;
  var fullmealapi;
  List categoryname = [
    0,
  ];
  List categorythumbnail = [
    0,
  ];
  List categorydescription = [
    0,
  ];
  List allmealname = [
    0,
  ];
  List allmealthumbnail = [];
  List allmealdescription = [
    0,
  ];
//
  List finalfullcategories = [];
  List finalfullmeal = [];
  //
//the first ssection api handeling
  //
  Future<void> getallcategories() async {
    final response = await http
        .get(Uri.parse("https://themealdb.com/api/json/v1/1/categories.php"));

    if (response.statusCode == 200) {
      fullresponsecategories = jsonDecode(response.body);
      finalfullcategories = fullresponsecategories['categories'];
    }
     else {
 }
    //converting each json string to the list
    for (var i = 0; i < finalfullcategories.length; i++) {
      var catname = finalfullcategories[i]['strCategory'];
      categoryname.add(catname);
      var catthumb = finalfullcategories[i]['strCategoryThumb'];
      categorythumbnail.add(catthumb);
      var catdesc = finalfullcategories[i]['strCategoryDescription'];
      categorydescription.add(catdesc);
    }
  }
  //
  //Second section all meals api handeling
  //
  Future<void> getallmeal() async {
    final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/list.php?i=list"));
//converting the json string to the list
    if (response.statusCode == 200) {
      fullmealapi = jsonDecode(response.body);
      finalfullmeal = fullmealapi['meals'];
    } else {}
    //converting each json string to list
    for (var i = 0; i <50; i++) {   //finalfullmeal.length
      var mealname = finalfullmeal[i]['strIngredient'];
      allmealname.add(mealname);
      var mealdesc = finalfullmeal[i]['strDescription'];
      allmealdescription.add(mealdesc);
      allmealthumbnail.add(mealname);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
             
            ),
          ],
          toolbarHeight: 60,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 4.1, bottom: 15),
            title: const Text(
              "Preapre For Lunch ",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.75,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("lib/assets/bg.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.45), BlendMode.darken),
                ),
              ),
            ),
          ),
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height / 3,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "Hum,hungry ?    😋",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              //
              //
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10, left: 12, right: 12),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade300,
                ),
                //
                //
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15, left: 35),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, size: 30),
                    hintText: '  Search Any Recipie. . . . .',
                  ),
                ),
              ),
              //
              //
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(15),
                child: const Text(
                  "Try This",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              //
              //
              Container(
                height: 240,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: FutureBuilder(
                  future: getallmeal(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(10),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 12,
                          );
                        },
                        itemCount: finalfullcategories.length,
                        itemBuilder: (context, index) {
                          return buildcard1(index + 1, categoryname,
                              categorythumbnail, categorydescription, context);
                        },
                      );
                    }
                  },
                ),
              ),
              //
              //
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "All Meals",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              //
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                padding: const EdgeInsets.all(10),
                child: FutureBuilder(
                  future: getallcategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("loading");
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 40.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return buildcard2(
                              index + 1,
                              allmealname,
                              allmealthumbnail[index],
                              allmealdescription,
                              context);
                        },
                      );
                    }
                  },
                ),
              ),
              //
              //
              //adding the extra to see the refresh scene 
            ],
          ),
        ),
      ],
    );
  }
}
