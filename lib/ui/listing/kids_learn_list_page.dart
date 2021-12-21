import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../api/entities/kids_model.dart';
import '../../blocs/kids_learn_list/kids_learn_list_bloc.dart';
import '../../blocs/kids_learn_list/kids_learn_list_contract.dart';
import '../../core/base_state.dart';
import '../../core/scroll_notifier.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/images.dart';
import '../../core/utils/static_data.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/styles.dart';
import '../../core/utils/transition_duration.dart';
import '../../core/view_actions.dart';
import '../detail/kids_learn_details_page.dart';
import 'widgets/list_item.dart';

class KidsLeanListPage extends StatefulWidget {
  const KidsLeanListPage({Key? key}) : super(key: key);

  @override
  _KidsLeanListPageState createState() => _KidsLeanListPageState();
}

class _KidsLeanListPageState
    extends BaseState<KidsLearnListBloc, KidsLeanListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        leadingWidth: 48,
        leading: Image.asset(
          Images.menu,
          width: 10,
          height: 10,
        ),
        title: Text(
          Strings.title,
          style: TextStyles.textBold.copyWith(
            color: AppColors.black,
          ),
        ),
        actions: [
          Container(
              height: 50,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                  color: AppColors.tigerColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                Images.tiger,
                height: 50,
                width: 45,
                fit: BoxFit.cover,
              )),
        ],
      ),
      body: SafeArea(
        child: BlocProvider<KidsLearnListBloc>(
          create: (BuildContext context) => bloc,
          child: BlocBuilder<KidsLearnListBloc, KidsLearnListData>(
              builder: (BuildContext context, KidsLearnListData data) {
            return _KidsLearnListContent(data: data);
          }),
        ),
      ),
    );
  }

  @override
  void onViewEvent(ViewAction event) async {
    switch (event.runtimeType) {
      case NavigateScreen:
        final screen = event as NavigateScreen;
        switch (screen.target) {
          case AuthTarget.KIDS_LEARN_DETAILS:
            unawaited(
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: TransitionDuration.extremeSlow,
                  reverseTransitionDuration: TransitionDuration.extremeSlow,
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return KidsLearnDetailsPage(
                      kidsModel: screen.data as KidsModel,
                    );
                  },
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              ),
            );
            break;
        }
        break;
    }
  }
}

class _KidsLearnListContent extends StatelessWidget {
  const _KidsLearnListContent({required this.data, Key? key}) : super(key: key);
  final KidsLearnListData data;

  @override
  Widget build(BuildContext context) {
    return _KidsLearnList();
  }
}

class _KidsLearnList extends StatefulWidget {
  _KidsLearnList({Key? key}) : super(key: key);

  @override
  State<_KidsLearnList> createState() => _KidsLearnListState();
}

class _KidsLearnListState extends State<_KidsLearnList>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    animationController.addListener(() {});
    animationController.forward();
  }

  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ScrollEventNotifier(false, false),
      child: Builder(builder: (context) {
        var scrollListner = Provider.of<ScrollEventNotifier>(context);
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollStartNotification) {
              scrollListner.isScrolling = true;
            } else if (notification is ScrollEndNotification) {
              scrollListner.isScrolling = false;
            }
            if (controller.position.userScrollDirection ==
                ScrollDirection.reverse) {
              scrollListner.isReverseScrolling = false;
            } else if (controller.position.userScrollDirection ==
                ScrollDirection.forward) {
              scrollListner.isReverseScrolling = true;
            }
            return true;
          },
          child: ListView.builder(
              controller: controller,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _onTapListener(
                    context: context,
                    kidsModel: list[index],
                  ),
                  child: TweenAnimationBuilder(
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 250),
                    tween: Tween<double>(
                        begin: scrollListner.isScrolling
                            ? scrollListner.isReverseScrolling
                                ? 0.35
                                : 0.0
                            : -0.35,
                        end: scrollListner.isScrolling
                            ? scrollListner.isReverseScrolling
                                ? 0.35
                                : -0.35
                            : 0),
                    builder: (_, double rotation, _child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.005)
                          ..scale(scrollListner.isScrolling ? 0.93 : 0.99, scrollListner.isScrolling ? 0.8 : 0.92)
                          ..rotateX(rotation),
                        child: _child,
                      );
                    },
                    child: ListItem(
                      kidsModel: list[index],
                    ),
                  ),
                );
              }),
        );
      }),
    );
  }

  void _onTapListener(
      {required BuildContext context, required KidsModel kidsModel}) {
    BlocProvider.of<KidsLearnListBloc>(context).add(
      NavigateEvent(AuthTarget.KIDS_LEARN_DETAILS, kidsModel: kidsModel),
    );
  }
}
