import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_themes_example/ui/global/theme/app_themes.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState(themeData: appThemeData[AppTheme.OrangeDark]);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.theme]);
      
    }
  }
}
