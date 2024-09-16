import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/login_method.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/user.dart';
import 'package:mysam_app/app/app_launch/auth/data/repo/auth_repository.dart';
import 'package:mysam_app/core/navigation/app_navigation.dart';
import 'package:mysam_app/core/resources/assets/assets.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/translation/app_locale_config.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/utils/alert.dart';
import 'package:mysam_app/core/widgets/components/custom_elevated_button.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:mysam_app/core/widgets/components/text_field.dart';
import 'package:mysam_app/core/widgets/loading_overlay.dart';
import 'package:mysam_app/core/widgets/navigation/bottom_nav/bottom_navigation/ui/imports/bottom_navigation_imports.dart';
import 'package:playx/playx.dart';

part '../bindings/login_binding.dart';
part '../controllers/login_controller.dart';
part '../views/login_view.dart';
part '../views/widgets/build_choose_login_method_widget.dart';
part '../views/widgets/build_login_back_button.dart';
part '../views/widgets/build_login_button.dart';
part '../views/widgets/build_login_continue_with_social.dart';
part '../views/widgets/build_login_email_field.dart';
part '../views/widgets/build_login_loading_overlay.dart';
part '../views/widgets/build_login_lottie_animation.dart';
part '../views/widgets/build_login_method_button.dart';
part '../views/widgets/build_login_password_field.dart';
part '../views/widgets/build_login_prompot.dart';
part '../views/widgets/build_login_register_now.dart';
part '../views/widgets/build_login_save_login_info_widget.dart';
part '../views/widgets/build_login_subtitle.dart';
part '../views/widgets/build_login_title.dart';
part '../views/widgets/build_login_with_email_widget.dart';
