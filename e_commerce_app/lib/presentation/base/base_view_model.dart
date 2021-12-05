abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // Here we share variables and methods.
}

abstract class BaseViewModelInputs {
  void start(); // call while initialze viewModel

  void dispose(); // call when viewModel die
}

abstract class BaseViewModelOutputs {}
