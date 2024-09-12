part of '../imports/home_imports.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: AppTrans.home,
        child: Container(
            child: CustomScrollView(
          slivers: [],
        )));
  }
}
