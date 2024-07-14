import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_calo_app/src/models/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_calo_app/src/presentations/screens/screen.dart';
import 'package:mobile_calo_app/src/services/service.dart';
import 'package:m_widget/m_widget.dart';
import 'package:mobile_calo_app/src/utils/util.dart';

part 'user_blocs/user_bloc.dart';
part 'user_blocs/user_event.dart';
part 'user_blocs/user_state.dart';

part 'auth_blocs/authentication_bloc.dart';
part 'auth_blocs/authentication_event.dart';
part 'auth_blocs/authentication_state.dart';

part 'home_blocs/home_bloc.dart';
part 'home_blocs/home_event.dart';
part 'home_blocs/home_state.dart';

part 'profile_blocs/profile_bloc.dart';
part 'profile_blocs/profile_event.dart';
part 'profile_blocs/profile_state.dart';

part 'wallet_blocs/wallet_bloc.dart';
part 'wallet_blocs/wallet_event.dart';
part 'wallet_blocs/wallet_state.dart';

part 'history_blocs/history_bloc.dart';
part 'history_blocs/history_event.dart';
part 'history_blocs/history_state.dart';

part 'event_blocs/event_bloc.dart';
part 'event_blocs/event_event.dart';
part 'event_blocs/event_state.dart';