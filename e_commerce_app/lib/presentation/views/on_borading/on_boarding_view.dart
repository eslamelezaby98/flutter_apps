import 'package:e_commerce_app/domain/slider_model.dart';
import 'package:e_commerce_app/presentation/app_manager/color_manager.dart';
import 'package:e_commerce_app/presentation/app_manager/routes_manager.dart';
import 'package:e_commerce_app/presentation/app_manager/strings_manager.dart';
import 'package:e_commerce_app/presentation/app_manager/value_manager.dart';
import 'package:e_commerce_app/presentation/views/on_borading/on_boarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoradingView extends StatefulWidget {
  const OnBoradingView({Key? key}) : super(key: key);

  @override
  State<OnBoradingView> createState() => _OnBoradingViewState();
}

class _OnBoradingViewState extends State<OnBoradingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnBoradingViewModel _onBoradingViewModel = OnBoradingViewModel();

  _binding() {
    _onBoradingViewModel.start();
  }

  @override
  void initState() {
    _binding();
    super.initState();
  }

  @override
  void dispose() {
    _onBoradingViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _onBoradingViewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Scaffold _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Scaffold(
        body: Container(),
      );
    } else {
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
          itemCount: sliderViewObject.numsOfSlider,
          controller: _pageController,
          onPageChanged: (int index) {
            _onBoradingViewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoradingPage(
              sliderViewObject.sliderObject,
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    StringsManager.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              // bottom sheet.
              _getBottomSheet(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  _getBottomSheet(SliderViewObject sliderViewObject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            _pageController.animateToPage(
              _onBoradingViewModel.goPrevious(),
              duration: const Duration(milliseconds: DurationApp.d300),
              curve: Curves.bounceInOut,
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Row(
          children: [
            for (int index = 0; index < sliderViewObject.numsOfSlider; index++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getCircel(index, sliderViewObject.currentIndex),
              ),
          ],
        ),
        IconButton(
          onPressed: () {
            _pageController.animateToPage(
              _onBoradingViewModel.goNext(),
              duration: const Duration(milliseconds: DurationApp.d300),
              curve: Curves.bounceInOut,
            );
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
        ),
      ],
    );
  }

  _getCircel(int index, int currentIndex) {
    if (index == currentIndex) {
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
