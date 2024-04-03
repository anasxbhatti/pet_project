import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:pet_project/views/addPet/components/bottom_widget.dart';
import 'package:pet_project/views/addPet/components/pet_view_1.dart';
import 'package:pet_project/views/addPet/components/pet_view_2.dart';
import 'package:pet_project/views/addPet/components/pet_view_3.dart';
import 'package:pet_project/views/addPet/components/pet_view_4.dart';
import 'package:pet_project/views/addPet/components/pet_view_5.dart';
import 'package:pet_project/views/addPet/components/pet_view_6.dart';

class AddPetView extends StatefulWidget {
  const AddPetView({super.key});

  @override
  State<AddPetView> createState() => _AddPetViewState();
}

class _AddPetViewState extends State<AddPetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Pet"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              child: SizedBox(
                height: 225,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Column(
                      children: [
                        const Spacer(),
                        Text(
                          "You haven't connected any pets",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 16.0,
                                  ),
                        ),
                        Text(
                          "Add your first pet.",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 16.0,
                                  ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AddPetInitial(),
                            ),
                          ),
                          child: SvgPicture.asset(
                            AppConstants.addPet,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 16,
                      child: Image.asset(
                        AppConstants.dog,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddPetInitial extends StatefulWidget {
  const AddPetInitial({super.key});

  @override
  State<AddPetInitial> createState() => _AddPetInitialState();
}

class _AddPetInitialState extends State<AddPetInitial> {
  late final PageController _pageController;
  int currentIndex = 0;
  final Duration _duration = const Duration(milliseconds: 250);
  final Curve curve = Curves.easeIn;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  final _pages = const [
    AddPetView1(),
    PetView2(),
    PetView3(),
    PetView4(),
    PetView5(),
    PetView6(),
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 4.0,
                color: AppConstants.appBarLightYellow,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                    bottomRight: Radius.circular(34),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppConstants.backIconTop,
                      ),
                    ),
                    // Center(
                    //   child: Text(
                    //     "Add Pet",
                    //     style:
                    //         Theme.of(context).textTheme.titleMedium?.copyWith(
                    //               fontSize: 20.0,
                    //             ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Stack(
              children: [
                Center(child: SvgPicture.asset(AppConstants.statusContainer)),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 5),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Text(
                              "STEP 1/6",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: LinearProgressIndicator(
                          value: .5,
                          minHeight: 12,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return _pages[index];
                },
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: _pages.length,
              ),
            ),
            // if (_pageController.positions.isNotEmpty)
            if (currentIndex == 0)
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    1,
                    duration: _duration,
                    curve: curve,
                  );
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const PetView2(),
                  //   ),
                  // );
                },
                child: SvgPicture.asset(
                  AppConstants.continueButton1,
                ),
              )
            else
              BottomWidget(
                currentIndex: currentIndex,
                pageController: _pageController,
                onBackPress: () {
                  switch (currentIndex) {
                    case 0:
                      break;
                    case 1:
                      _pageController.animateToPage(0,
                          duration: _duration, curve: curve);
                      break;
                    case 2:
                      _pageController.animateToPage(1,
                          duration: _duration, curve: curve);
                      break;
                    case 3:
                      _pageController.animateToPage(2,
                          duration: _duration, curve: curve);
                      break;
                    case 4:
                      _pageController.animateToPage(3,
                          duration: _duration, curve: curve);
                      break;
                    case 5:
                      _pageController.animateToPage(4,
                          duration: _duration, curve: curve);
                      break;

                    default:
                  }
                },
              ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
