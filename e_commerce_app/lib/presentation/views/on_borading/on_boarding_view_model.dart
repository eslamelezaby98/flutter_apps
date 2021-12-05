import 'dart:async';

import 'package:e_commerce_app/domain/slider_model.dart';
import 'package:e_commerce_app/presentation/app_manager/assets_maanger.dart';
import 'package:e_commerce_app/presentation/app_manager/strings_manager.dart';
import 'package:e_commerce_app/presentation/base/base_view_model.dart';

class OnBoradingViewModel extends BaseViewModel
    with OnBoradingViewModelInput, OnBoradingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderObject();
    _postDataToView();
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

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

  _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(_list[_currentIndex], _list.length, _currentIndex),
    );
  }
}

// recieve inputs from view (events)
abstract class OnBoradingViewModelInput {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);
  Sink get inputSliderViewObject; // add data to stream.
}

//data will be sent from viewModel to view
abstract class OnBoradingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numsOfSlider;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numsOfSlider, this.currentIndex);
}
