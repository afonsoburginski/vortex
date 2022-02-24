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
            aspectRatio: 1.5,
            viewportFraction: 0.95,
            autoPlay: false,
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
                      color: black.withOpacity(0.3)),
                ),
              ),
            );
          }),
        ),
        /* BOTOES */
        SizedBox(height: 25),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(recomended.length, (index) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 15 : 10,
                      right: index == (recomended.length - 1) ? 15 : 0),
                  child: Container(
                      height: 60,
                      width: 125,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(recomended[index]),
                            fit: BoxFit.cover,
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 8),
                                color: Color(0x4960F9).withOpacity(.9),
                                spreadRadius: 5,
                                blurRadius: 600)
                          ],
                        ),
                        child: MaterialButton(
                          onPressed: () {},
                          splashColor: Color(0xff4960F9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 50.0,
                                  minHeight:
                                      10.0), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: Text('#CA',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600))),
                        ),
                      )));
            }),
          ),
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
                "VORTEX",
                style: TextStyle(color: grey),
              ),
              SizedBox(width: 5),
              Text(
                "RECOMENDADOS",
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
            children: List.generate(recomended.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (recomended.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(recomended[index]),
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
                "AÇÃO",
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
            children: List.generate(action.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (action.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(action[index]),
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
                "COMÉDIA",
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
            children: List.generate(comedy.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (comedy.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(comedy[index]),
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
                "ROMANCE",
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
            children: List.generate(romance.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (romance.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(romance[index]),
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
                "CARTOON",
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
            children: List.generate(cartoon.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (cartoon.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(cartoon[index]),
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
                "TERROR",
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
            children: List.generate(horror.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (horror.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(horror[index]),
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
                "FICÇÃO CIENTÍFICA",
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
            children: List.generate(scienceFiction.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (scienceFiction.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(scienceFiction[index]),
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
                "DOCUMENTÁRIOS",
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
            children: List.generate(documentary.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: index == (documentary.length - 1) ? 15 : 0),
                child: Container(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(documentary[index]),
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
