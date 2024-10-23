import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationLoginEvent>(_onLogin);
    on<AuthenticationLogoutEvent>(_onLogout);
  }

  // Initialize the list of books
  void init() {}

  // Event handlers
  void _onLogin(
      AuthenticationLoginEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationLoggedIn());
  }

  void _onLogout(
      AuthenticationLogoutEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationLoggedOut());
  }
}
