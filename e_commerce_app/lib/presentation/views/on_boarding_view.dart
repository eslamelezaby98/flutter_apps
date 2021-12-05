import 'package:e_commerce_app/presentation/app_manager/assets_maanger.dart';
import 'package:e_commerce_app/presentation/app_manager/color_manager.dart';
import 'package:e_commerce_app/presentation/app_manager/strings_manager.dart';
import 'package:e_commerce_app/presentation/app_manager/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoradingView extends StatefulWidget {
  const OnBoradingView({Key? key}) : super(key: key);

  @override
  State<OnBoradingView> createState() => _OnBoradingViewState();
}

class _OnBoradingViewState extends State<OnBoradingView> {
  late final List<SliderObject> _list = _getSliderObject();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject> _getSliderObject() {
    return [
      SliderObject(
        title: StringsManager.onBoardingTitle1,
        subTitle: StringsManager.onBoardingSubTitle1,
        image: ImageAsset.onboardingLogo1,
      ),
      SliderObject(
        title: StringsManager.onBoardingTitle2,
        subTitle: StringsManager.onBoardingSubTitle2,
        image: ImageAsset.onboardingLogo2,
      ),
      SliderObject(
        title: StringsManager.onBoardingTitle3,
        subTitle: StringsManager.onBoardingSubTitle3,
        image: ImageAsset.onboardingLogo3,
      ),
      SliderObject(
        title: StringsManager.onBoardingTitle4,
        subTitle: StringsManager.onBoardingSubTitle4,
        image: ImageAsset.onboardingLogo4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        itemCount: _list.length,
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoradingPage(
            _list[index],
          );
        },
      ),
      bottomSheet: Container(
        height: AppSize.s100,
        color: ColorManager.white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  StringsManager.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            // bottom sheet.
            _getBottomSheet(),
          ],
        ),
      ),
    );
  }

  _getBottomSheet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Row(
          children: [
            for (int index = 0; index < _list.length; index++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getCircel(index),
              ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
        ),
      ],
    );
  }

  _getCircel(int index) {
    if (index == _currentIndex) {
      return const Icon(
        Icons.circle,
      );
    } else {
      return const Icon(
        Icons.circle_outlined,
      );
    }
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}

class OnBoradingPage extends StatelessWidget {
  final SliderObject sliderObject;

  const OnBoradingPage(this.sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}
