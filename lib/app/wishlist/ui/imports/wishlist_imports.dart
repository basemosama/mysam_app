import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mysam_app/app/wishlist/data/model/ui/wishlist.dart';
import 'package:mysam_app/app/wishlist/data/repository/wishlist_repository.dart';
import 'package:mysam_app/core/data_state/models/data_error.dart';
import 'package:mysam_app/core/data_state/models/data_state.dart';
import 'package:mysam_app/core/data_state/widgets/rx_data_state_widget.dart';
import 'package:mysam_app/core/navigation/app_routes.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/widgets/components/custom_card.dart';
import 'package:mysam_app/core/widgets/components/custom_scaffold.dart';
import 'package:mysam_app/core/widgets/components/custom_text.dart';
import 'package:mysam_app/core/widgets/custom_app_bar.dart';
import 'package:playx/playx.dart';

part '../binding/wishlist_binding.dart';
part '../binding/wishlist_details_binding.dart';
part '../controller/wishlist_controller.dart';
part '../view/wishlist_view.dart';
