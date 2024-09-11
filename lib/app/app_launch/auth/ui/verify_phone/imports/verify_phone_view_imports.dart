import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api_user.dart';
import 'package:mysam_app/app/app_launch/auth/data/repo/auth_repository.dart';
import 'package:mysam_app/core/navigation/app_navigation.dart';
import 'package:mysam_app/core/resources/assets/assets.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/utils/alert.dart';
import 'package:mysam_app/core/widgets/components/custom_elevated_button.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:pinput/pinput.dart';
import 'package:playx/playx.dart';

part '../bindings/verify_phone_binding.dart';
part '../controllers/verify_phone_controller.dart';
part '../views/verify_phone_view.dart';
part '../views/widgets/build_verify_button.dart';
part '../views/widgets/build_verify_code_not_received_widget.dart';
part '../views/widgets/build_verify_lottie_animation.dart';
part '../views/widgets/build_verify_otp_field.dart';
part '../views/widgets/build_verify_phone_text.dart';
part '../views/widgets/build_verify_subtitle_text.dart';
