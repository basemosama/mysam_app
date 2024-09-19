import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_info.dart';
import 'package:mysam_app/core/data_state/models/data_state.dart';
import 'package:mysam_app/core/data_state/models/rx_data_state.dart';
import 'package:mysam_app/core/data_state/widgets/rx_data_state_widget.dart';
import 'package:mysam_app/core/models/icon_info.dart';
import 'package:mysam_app/core/navigation/app_navigation.dart';
import 'package:mysam_app/core/preferences/preference_manger.dart';
import 'package:mysam_app/core/resources/assets/assets.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/widgets/components/custom_elevated_button.dart';
import 'package:mysam_app/core/widgets/components/custom_scaffold.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:mysam_app/core/widgets/place_holder_image.dart';
import 'package:playx/playx.dart';

part '../binding/profile_binding.dart';
part '../controller/profile_controller.dart';
part '../view/profile_view.dart';
part '../view/widgets/build_profile_field_widget.dart';
part '../view/widgets/build_profile_fields_widget.dart';
part '../view/widgets/build_profile_image_widget.dart';
part '../view/widgets/build_profile_user_email_widget.dart';
part '../view/widgets/build_profile_user_name_widget.dart';
