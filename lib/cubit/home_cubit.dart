part of 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialState()) {
    getCurrency();
  }

  HomeRepository currencyService = HomeRepository();
  Future<void> getCurrency() async {
    await currencyService.openBox();
    if (currencyService.currencyBox!.isNotEmpty &&
        currencyService.currencyBox != null) {
      emit(HomeCompleteState(currencyService.currencyBox!.values.toList()));
    } else {
      updateCurrency();
    }
  }

  Future<void> updateCurrency() async {
    emit(HomeLoadingState());
    await currencyService.getCurrency().then((dynamic response) => {
      if(response is Box<CurrencyModel>){
        emit(HomeCompleteState(response.values.toList()))
      }else{
        emit(HomeErrorState(response))
      }
    });
  }
}
