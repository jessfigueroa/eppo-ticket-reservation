abstract class FormSubmitState {}

class NoSubmit extends FormSubmitState {}

class Submitting extends FormSubmitState {}

class SuccessSubmit extends FormSubmitState {}

class ErrorSubmit extends FormSubmitState {
  final errorMsg;
  ErrorSubmit(this.errorMsg);
}
