import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class MenuOpenCubit extends Cubit<bool> {
  MenuOpenCubit() : super(false);

  void openMenu() => emit(true);
  void closeMenu() => emit(false);

  @override
  void onChange(Change<bool> change) {
    print(change);
    super.onChange(change);
  }
}
