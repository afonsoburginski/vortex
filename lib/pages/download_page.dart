import 'package:flutter/material.dart';
import 'package:vortex/theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vortex/util/home_page_json.dart';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
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
            aspectRatio: 1.8,
            viewportFraction: 0.95,
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
        /* BOTAO */
        SizedBox(height: 30),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: List.generate(
                recomended.length,
                (index) {
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
                                  offset: Offset(0, 5),
                                  color: Color(0x4960F9).withOpacity(.9),
                                  spreadRadius: 5,
                                  blurRadius: 500)
                            ],
                            borderRadius: BorderRadius.circular(5),
                            gradient: const LinearGradient(colors: [
                              Color(0xff4960F9),
                              Color(0xff4960F9)
                            ])),
                        child: MaterialButton(
                          onPressed: () {},
                          splashColor: Color(0xff4960F9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                              decoration: BoxDecoration(
                                //gradient:
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7jvlqGsxeMKscskuUZgKk0Kuv99.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 50.0,
                                      minHeight:
                                          10.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: Text('AÇÃO',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)))),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ))
      ],
    );
  }
}
