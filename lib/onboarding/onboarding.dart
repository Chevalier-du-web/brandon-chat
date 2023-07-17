import 'package:flutter/material.dart';

import '../home.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  final String image;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel(
      {required this.title,
        required this.description,
        required this.image,
        this.bgColor = Colors.white,
        this.textColor = Colors.blue});
}

class OnboardingPage extends StatefulWidget {
  final List<OnboardingPageModel> pages;

  const OnboardingPage({Key? key, required this.pages}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Pageview to render each page
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    // Change current page when pageview changes
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final _item = widget.pages[idx];
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Image.asset(
                              _item.image,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(_item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: _item.textColor,
                                    )),
                              ),
                              Container(
                                constraints: BoxConstraints(maxWidth: 280),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 8.0),
                                child: Text(_item.description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                      color: _item.textColor,
                                    )),
                              )
                            ]))
                      ],
                    );
                  },
                ),
              ),

              // Current page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages
                    .map((item) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: _currentPage == widget.pages.indexOf(item)
                      ? 20
                      : 4,
                  height: 4,
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0)),
                ))
                    .toList(),
              ),

              // Bottom buttons
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: _currentPage==2?MainAxisAlignment.center:MainAxisAlignment.spaceBetween,
                  children: [
                    _currentPage==2?Container():TextButton(
                        onPressed: () {
                          // Handle Skipping onboarding page
                          _pageController.animateToPage(2,
                              curve: Curves.easeInOutCubic,
                              duration: const Duration(milliseconds: 250));                        },
                        child: Text(
                          _currentPage==2?"":"Skip",
                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                      onPressed: () {
                        if (_currentPage == widget.pages.length - 1) {
                          // This is the last page
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        } else {
                          _pageController.animateToPage(_currentPage + 1,
                              curve: Curves.easeInOutCubic,
                              duration: const Duration(milliseconds: 250));
                        }
                      },
                      child: _currentPage==2?
                      Container(
                        padding: EdgeInsets.only(left: 60,right: 60,top: 20,bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Text(
                          "Get started "
                              ,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ):
                      Text(
                      "Next  ",
                        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
