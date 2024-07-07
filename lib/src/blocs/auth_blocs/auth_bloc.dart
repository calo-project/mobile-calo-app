part of '../bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<LoginEvent>(_onLogin);
    on<CheckAuthEvent>(_onCheckAuth);
    on<LogoutEvent>((event, emit) async {
      await _onLogout(event, emit);
    });
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final data = await authRepository.signUp(
          event.email, event.password, event.namaPengguna);
      final token = data['token'];
      await authRepository.saveToken(token);
      final user = User.fromJson(data['user']);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final data = await authRepository.login(event.email, event.password);
      if(kDebugMode){
        print(data);
      }
      final token = data['token'];
      await authRepository.saveToken(token);
      final user = User.fromJson(data['user']);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onCheckAuth(
    CheckAuthEvent event, Emitter<AuthState> emit) async {
    final token = await authRepository.getToken();
    if (token != null) {
      try {
        final user = await authRepository.fetchUserDetails(token);
        emit(AuthAuthenticated(user: user));
      } catch (e) {
        emit(AuthUnauthenticated());
      }
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await authRepository.clearToken();
    emit(AuthUnauthenticated());
  }
}
