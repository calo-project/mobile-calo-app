import 'package:flutter/foundation.dart';
import 'package:mobile_calo_app/src/models/model.dart';
import 'package:mobile_calo_app/src/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'user_blocs/user_bloc.dart';
part 'user_blocs/user_event.dart';
part 'user_blocs/user_state.dart';

part 'auth_blocs/auth_bloc.dart';
part 'auth_blocs/auth_event.dart';
part 'auth_blocs/auth_state.dart';

part 'app_blocs/app_bloc.dart';
part 'app_blocs/app_event.dart';
part 'app_blocs/app_state.dart';