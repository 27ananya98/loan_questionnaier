class AppImages {
  get logo=>'assets/images/logo.png';

  static final AppImages _appImages =  AppImages._internal();
  factory AppImages() {
    return _appImages;
  }
  AppImages._internal();
}
AppImages appImages =  AppImages();