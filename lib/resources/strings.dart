class AppStrings {


  static final AppStrings _appStrings =  AppStrings._internal();
  factory AppStrings() {
    return _appStrings;
  }
  AppStrings._internal();

  String get alert => 'Alert';
  String get yourAuthExpired => 'Your authentication has expired please login again';
  String get weUnable => 'We\'re unable to process your request.\nPlease try again.';
  String get retry => 'Retry';
  String get weUnableCheckData => 'We\'re unable to show results.\nPlease check your data\nconnection.';
  String get noInternet => 'No Internet Available';
  String get ok => 'Ok';
}
AppStrings appStrings = AppStrings();
