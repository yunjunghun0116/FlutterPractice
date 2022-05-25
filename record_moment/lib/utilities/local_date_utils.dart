class LocalDateUtils{

  LocalDateUtils._constructor();

  static final LocalDateUtils _localDateUtils = LocalDateUtils._constructor();

  factory LocalDateUtils() => _localDateUtils;

  int getDayLength(int year,int month){
    if(month == 2){
      if(year%4==0) return 29;
      return 28;
    }
    if(month<8){
      return 30+month%2;
    }
    return 30+(month+1)%2;
  }

}

