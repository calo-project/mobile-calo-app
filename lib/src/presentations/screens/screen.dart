import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_calo_app/src/blocs/bloc.dart';
import 'package:mobile_calo_app/src/navigations/navigation.dart';
import 'package:mobile_calo_app/src/presentations/fragments/fragment.dart';
import 'package:mobile_calo_app/src/utils/util.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_calo_app/src/presentations/widgets/widget.dart';
import 'package:mobile_calo_app/main.dart';
import 'package:image_picker/image_picker.dart';

part 'welcome_screen.dart';
part 'home_screen.dart';

part 'history_screens/verified_screen.dart';
part 'history_screens/not_verified_screen.dart';
part 'history_screens/detail_history_screen.dart';

part 'event_screens/detail_event_screen.dart';
part 'event_screens/event_screen.dart';
part 'event_screens/search_event_screen.dart';

part 'auth_screens/sign_in_screen.dart';
part 'auth_screens/sign_up_screen.dart';

part 'profile/update_password_screen.dart';
part 'profile/update_profile_screen.dart';
part 'profile/faq_screen.dart';
part 'profile/update_wallet_screen.dart';
