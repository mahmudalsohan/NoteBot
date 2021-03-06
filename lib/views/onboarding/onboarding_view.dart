import 'package:butex_notebot/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class OnBoardingView extends StatelessWidget {
  final _controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            _controller.onboardingPages[index].imageAsset),
                        SizedBox(height: 32),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

            //Dots Indicator
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),

            //Next or Start Button
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                elevation: 0,
                onPressed: _controller.forwardAction,
                child: Obx(() {
                  return Text(
                    _controller.isLastPage ? 'Start' : 'Next',
                    style: TextStyle(color: Colors.white),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
