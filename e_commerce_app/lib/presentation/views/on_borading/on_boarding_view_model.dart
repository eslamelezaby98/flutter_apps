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
  int goNext() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex = _list.length - 1;
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex++;
    if (previousIndex >= _list.length) {
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
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
        image: AssetManager.onboardingLogo1,
      ),
      SliderObject(
        title: StringsManager.onBoardingTitle2,
        subTitle: StringsManager.onBoardingSubTitle2,
        image: AssetManager.onboardingLogo2,
      ),
      SliderObject(
        title: StringsManager.onBoardingTitle3,
        subTitle: StringsManager.onBoardingSubTitle3,
        image: AssetManager.onboardingLogo3,
      ),
      SliderObject(
        title: StringsManager.onBoardingTitle4,
        subTitle: StringsManager.onBoardingSubTitle4,
        image: AssetManager.onboardingLogo4,
      )
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
