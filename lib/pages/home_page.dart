import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vortex/pages/movie_detail_page.dart';
import 'package:vortex/theme/color.dart';
import 'package:vortex/util/home_page_json.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: getBody(size),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            viewportFraction: 0.96,
            autoPlay: true,
          ),
          items: List.generate(sliders.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(sliders[index]),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: black.withOpacity(0.2)),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                "CONTINUE",
                style: TextStyle(color: grey),
              ),
              SizedBox(width: 5),
              Text(
                "ASSISTINDO",
                style: TextStyle(color: white, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: grey,
                size: 16,
              )
            ],
          ),
        ),
        SizedBox(height: 25),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(continueWatchings.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (continueWatchings.length - 1) ? 15 : 0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MovieDetailPage()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 180,
                        width: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(
                                  continueWatchings[index]['imageUrl']),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 125,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 3,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: white,
                                    ),
                                  ),
                                  Container(
                                    height: 3,
                                    width: continueWatchings[0]['timeline'],
                                    decoration: BoxDecoration(
                                      color: red,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    continueWatchings[0]['name'],
                                    style:
                                        TextStyle(color: white, fontSize: 14),
                                  ),
                                  Icon(
                                    LineIcons.playCircle,
                                    color: white,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                "MINHA",
                style: TextStyle(color: grey),
              ),
              SizedBox(width: 5),
              Text(
                "LISTA",
                style: TextStyle(color: white, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: grey,
                size: 16,
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(myLists.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (myLists.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(myLists[index]),
                        fit: BoxFit.cover,
                      )),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                "NETFLIX",
                style: TextStyle(color: grey),
              ),
              SizedBox(width: 5),
              Text(
                "ORIGINAL",
                style: TextStyle(color: white, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: grey,
                size: 16,
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(netflixOriginals.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (netflixOriginals.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(netflixOriginals[index]),
                        fit: BoxFit.cover,
                      )),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                "MINHA",
                style: TextStyle(color: grey),
              ),
              SizedBox(width: 5),
              Text(
                "LISTA",
                style: TextStyle(color: white, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: grey,
                size: 16,
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(lista1.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (lista1.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(lista1[index]),
                        fit: BoxFit.cover,
                      )),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                "MINHA",
                style: TextStyle(color: grey),
              ),
              SizedBox(width: 5),
              Text(
                "LISTA",
                style: TextStyle(color: white, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: grey,
                size: 16,
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(lista2.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (lista2.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(lista2[index]),
                        fit: BoxFit.cover,
                      )),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                "MINHA",
                style: TextStyle(color: grey),
              ),
              SizedBox(width: 5),
              Text(
                "LISTA",
                style: TextStyle(color: white, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: grey,
                size: 16,
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(lista3.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (lista3.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(lista3[index]),
                        fit: BoxFit.cover,
                      )),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                "MINHA",
                style: TextStyle(color: grey),
              ),
              SizedBox(width: 5),
              Text(
                "LISTA",
                style: TextStyle(color: white, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: grey,
                size: 16,
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(lista4.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (lista4.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(lista4[index]),
                        fit: BoxFit.cover,
                      )),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
