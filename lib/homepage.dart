import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:summer_cloth_collection_ui/dummy_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Collection",
                      style: TextStyle(
                          fontSize: 25, color: Colors.grey, fontFamily: 'Lato'),
                    ),
                    const Text(
                      "Summer 2022",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        pageindicator(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (currentIndex < pictures.length - 1) {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              } else {
                                currentIndex = 0;
                                pageController.animateToPage(currentIndex,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              }
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: size.width,
                        height: double.infinity,
                        child: PageView.builder(
                            itemCount: pictures.length,
                            physics: const BouncingScrollPhysics(),
                            controller: pageController,
                            onPageChanged: (newpage) {
                              setState(() {
                                currentIndex = newpage;
                              });
                            },
                            itemBuilder: (ctx, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(pictures[index]),
                                        fit: BoxFit.cover)),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  //smoothpage
  SmoothPageIndicator pageindicator() {
    return SmoothPageIndicator(
      controller: pageController,
      count: pictures.length,
      effect: const ExpandingDotsEffect(
          spacing: 4.0,
          radius: 10.0,
          dotColor: Colors.grey,
          dotWidth: 18.0,
          dotHeight: 10.0,
          expansionFactor: 3.8,
          activeDotColor: Colors.black),
      onDotClicked: (newIndex) {
        setState(() {
          pageController.animateToPage(newIndex,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        });
      },
    );
  }
}
//
