import 'package:flutter/material.dart';
import 'package:mysam_app/core/navigation/app_navigation.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/widgets/custom_app_bar.dart';
import 'package:mysam_app/core/widgets/navigation/navigation_drawer/ui/imports/custom_navigation_drawer_imports.dart';
import 'package:playx/playx.dart';

import '../../../../core/resources/translation/app_locale_config.dart';
import '../../../../core/resources/translation/app_translations.dart';
import '../../../../core/utils/alert.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/bottom_sheet/custom_modal.dart';
import '../../../../core/widgets/components/custom_card.dart';
import '../../../../core/widgets/components/custom_dialog.dart';
import '../../../../core/widgets/components/custom_scaffold.dart';
import '../../../../core/widgets/components/custom_text.dart';
import '../../../app_launch/auth/data/repo/auth_repository.dart';

part '../binding/settings_binding.dart';
part '../controller/settings_controller.dart';
part '../view/settings_view.dart';
part '../view/widgets/build_settings_language_widget.dart';
part '../view/widgets/build_settings_logout_widget.dart';
part '../view/widgets/build_settings_theme_widget.dart';
part '../view/widgets/common/settings_dialog.dart';
part '../view/widgets/common/settings_page.dart';
part '../view/widgets/common/settings_tile.dart';
