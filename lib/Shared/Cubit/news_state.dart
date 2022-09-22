part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class LoadingAllNews extends NewsState{}

class SuccessAllNews extends NewsState{}

class ErrorAllNews extends NewsState{
late final String error;
ErrorAllNews(this.error);
}
class LoadingBusiness extends NewsState{}

class SuccessBusiness extends NewsState{}

class ErrorBusiness extends NewsState{
  late final String error;
  ErrorBusiness(this.error);
}
class LoadingSport extends NewsState{}

class SuccessSport extends NewsState{}

class ErrorSport extends NewsState{
  late final String error;
  ErrorSport(this.error);
}
class LoadingScience extends NewsState{}

class SuccessScience extends NewsState{}

class ErrorScience extends NewsState{
  late final String error;
  ErrorScience(this.error);
}
class LoadingSearch extends NewsState{}

class SuccessSearch extends NewsState{}

class ErrorSearch extends NewsState{
  late final String error;
  ErrorSearch(this.error);
}

class NewsbottomNav extends NewsState{}