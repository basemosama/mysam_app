part of '../imports/home_imports.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        child: Center(
      child: CustomText('Home View'),
    ));
  }
}
