import 'package:flutter/material.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/types/contribution_type.dart';
import 'package:mysam_app/app/contributions/contributions/ui/imports/contributions_imports.dart';
import 'package:mysam_app/app/home/roots/details/ui/imports/root_details_imports.dart';
import 'package:mysam_app/app/reviews/review_details/data/repository/review_details_repository.dart';
import 'package:mysam_app/app/reviews/reviews/ui/imports/reviews_imports.dart';
import 'package:mysam_app/core/data_state/models/data_state.dart';
import 'package:mysam_app/core/data_state/models/rx_data_state.dart';
import 'package:mysam_app/core/data_state/widgets/rx_data_state_widget.dart';
import 'package:mysam_app/core/models/icon_info.dart';
import 'package:mysam_app/core/navigation/app_navigation.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/translation/app_locale_config.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/utils/alert.dart';
import 'package:mysam_app/core/widgets/components/custom_card.dart';
import 'package:mysam_app/core/widgets/components/custom_icon_button.dart';
import 'package:mysam_app/core/widgets/components/custom_scaffold.dart';
import 'package:mysam_app/core/widgets/components/feature_chip.dart';
import 'package:mysam_app/core/widgets/custom_app_bar.dart';
import 'package:mysam_app/core/widgets/navigation/navigation_drawer/ui/imports/custom_navigation_drawer_imports.dart';
import 'package:mysam_app/core/widgets/place_holder_image.dart';
import 'package:playx/playx.dart';

part '../binding/review_details_binding.dart';
part '../controller/review_details_controller.dart';
part '../view/review_details_view.dart';
part '../view/widgets/build_review_contribution_details_Forum_widget.dart';
part '../view/widgets/build_review_contribution_details_review_contribution_by_type_widget.dart';
part '../view/widgets/types/build_review_contribution_details_body_description_review_contribution_widget.dart';
part '../view/widgets/types/build_review_contribution_details_photo_review_contribution_widget.dart';
part '../view/widgets/types/build_review_contribution_details_qa_review_contribution_widget.dart';
part '../view/widgets/types/build_review_contribution_details_words_review_contribution_widget.dart';
