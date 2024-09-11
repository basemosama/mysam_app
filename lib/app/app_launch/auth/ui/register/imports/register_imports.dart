import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api_user.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/login_method.dart';
import 'package:mysam_app/app/app_launch/auth/data/repo/auth_repository.dart';
import 'package:mysam_app/app/app_launch/auth/ui/login/imports/login_imports.dart';
import 'package:mysam_app/core/navigation/app_navigation.dart';
import 'package:mysam_app/core/resources/assets/assets.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/style/style.dart';
import 'package:mysam_app/core/resources/translation/app_locale_config.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/utils/alert.dart';
import 'package:mysam_app/core/utils/app_utils.dart';
import 'package:mysam_app/core/utils/are_equals_validation.dart';
import 'package:mysam_app/core/widgets/components/custom_elevated_button.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:mysam_app/core/widgets/components/text_field.dart';
import 'package:mysam_app/core/widgets/loading_overlay.dart';
import 'package:playx/playx.dart';

part '../bindings/register_binding.dart';
part '../controllers/register_controller.dart';
part '../views/register_view.dart';
part '../views/widgets/build_choose_register_method_widget.dart';
part '../views/widgets/build_register_button_widget.dart';
part '../views/widgets/build_register_confirm_password_widget.dart';
part '../views/widgets/build_register_continue_with_social.dart';
part '../views/widgets/build_register_dont_have_account_widget.dart';
part '../views/widgets/build_register_email_field_widget.dart';
part '../views/widgets/build_register_loading_overlay.dart';
part '../views/widgets/build_register_lottie_animation.dart';
part '../views/widgets/build_register_method_button.dart';
part '../views/widgets/build_register_password_field_widget.dart';
part '../views/widgets/build_register_prompt_widget.dart';
part '../views/widgets/build_register_subtitle.dart';
part '../views/widgets/build_register_terms_and_conditions_widget.dart';
part '../views/widgets/build_register_title_widget.dart';
part '../views/widgets/build_register_with_email_widget.dart';
