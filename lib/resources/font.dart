class AppFonts {



  static final AppFonts appFonts =  AppFonts._internal();
  factory AppFonts() {
    return appFonts;
  }
  AppFonts._internal();

  get muliLang => 'MULI-LIGHT';
  get openSansRegular => 'Open-Sans-Regular';
  get firaSansBold => 'FiraSans-Bold';
  get firaSansMedium => 'FiraSans-Medium';
  get interSemiBold => 'Inter-SemiBold';
  get interBold => 'Inter-Bold';
  get interRegular => 'Inter-Regular';
  get openSansLight => 'OpenSans-Light';
  get productSansRegular => 'Product-Sans-Regular';
  get firaSansRegular => 'FiraSans-Regular';
  get firaSansSemiBold => 'FiraSans-SemiBold';
  get muliRegular => 'MULI-REGULAR';
  get montserrat=>'Montserrat-Light';
  get montserratBold=>'Montserrat-Bold';
  get openSansSemiBold=>'OpenSans-SemiBold';
  get relawayMedium=>'Raleway-Medium';
  get interMedium=>'Inter-Medium';
  get openSansBold=>'OpenSans-Bold';
}
AppFonts appFonts =  AppFonts();
