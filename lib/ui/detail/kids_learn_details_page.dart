import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/entities/kids_model.dart';
import '../../blocs/kids_learn_details/kids_learn_details_bloc.dart';
import '../../blocs/kids_learn_details/kids_learn_details_contract.dart';
import '../../core/base_state.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/transition_duration.dart';
import '../../core/utils/utils_import.dart';
import '../../extension/context_extensions.dart';
import '../../extension/string_extensions.dart';

class KidsLearnDetailsPage extends StatefulWidget {
  const KidsLearnDetailsPage({required this.kidsModel, Key? key})
      : super(key: key);
  final KidsModel kidsModel;

  @override
  _KidsLearnDetailsPageState createState() => _KidsLearnDetailsPageState();
}

class _KidsLearnDetailsPageState
    extends BaseState<KidsLearnDetailsBloc, KidsLearnDetailsPage> {
      
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<KidsLearnDetailsBloc>(
          create: (BuildContext context) => bloc,
          child: BlocBuilder<KidsLearnDetailsBloc, KidsLearnDetailsData>(
              builder: (BuildContext context, KidsLearnDetailsData data) {
            return _KidsLearnDetailsContent(
              data: data,
              kidsModel: widget.kidsModel,
            );
          }),
        ),
    );
  }
}

class _KidsLearnDetailsContent extends StatelessWidget {
  const _KidsLearnDetailsContent(
      {required this.data, required this.kidsModel, Key? key})
      : super(key: key);
  final KidsLearnDetailsData data;
  final KidsModel kidsModel;

  @override
  Widget build(BuildContext context) {
    return _KidsLearnDetailsBody(data: data, kidsModel: kidsModel);
  }
}

class _KidsLearnDetailsBody extends StatefulWidget {
  const _KidsLearnDetailsBody(
      {required this.data, required this.kidsModel, Key? key})
      : super(key: key);
  final KidsLearnDetailsData data;
  final KidsModel kidsModel;

  @override
  State<_KidsLearnDetailsBody> createState() => _KidsLearnDetailsBodyState();
}

class _KidsLearnDetailsBodyState extends State<_KidsLearnDetailsBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> _fabAnimation;
  late Animation<Offset> _backArrowAnimation;
  late Animation<Offset> _detailsAnimation;

  @override
  void initState() {
    _createAnimationController();
    _createBackArrowAnimation();
    _createFabAnimation();
    _createDetailsAnimation();
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleOnWillPop,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: context.height / Dimens.height_half_screen,
                child: _HeaderUiHero(
                  kidsModel: widget.kidsModel,
                  animationController: _animationController,
                  backArrowAnimation: _backArrowAnimation,
                  function: _handleOnBackPressed,
                )),
            const SizedBox(
              height: Dimens.space_xxlarge,
            ),
            _DetailPageHero(
              animationController: _animationController,
              detailsAnimation: _detailsAnimation,
              kidsModel: widget.kidsModel,
            )
          ],
        ),
        floatingActionButton: SlideTransition(
          position: _fabAnimation,
          child: FadeTransition(
            opacity:
                _animationController.drive(CurveTween(curve: Curves.easeOut)),
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.radius_normal),
              ),
              backgroundColor: widget.kidsModel.color.toString().stringToColor,
              onPressed: () {},
              child: const Icon(
                Icons.seventeen_mp_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleOnBackPressed() {
    _animationController.reverse();
    BlocProvider.of<KidsLearnDetailsBloc>(context).add(CloseEvent());
  }

  Future<bool> _handleOnWillPop() async {
    _handleOnBackPressed();
    return true;
  }

  void _createAnimationController() {
    _animationController = AnimationController(
      duration: TransitionDuration.extremeSlow,
      vsync: this,
    );
  }

  void _createDetailsAnimation() {
    _detailsAnimation = _createAimation(
      begin: const Offset(0.0, 1.3),
      end: const Offset(0.0, 0.0),
    );
  }

  void _createFabAnimation() {
    _fabAnimation = _createAimation(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    );
  }

  void _createBackArrowAnimation() {
    _backArrowAnimation = _createAimation(
      begin: const Offset(2.5, 0.0),
      end: const Offset(0.0, 0.0),
    );
  }

  Animation<Offset> _createAimation({
    required Offset begin,
    required Offset end,
  }) {
    return Tween<Offset>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
  }
}

class _DetailPageHero extends StatelessWidget {
  const _DetailPageHero(
      {required this.kidsModel,
      required this.detailsAnimation,
      required this.animationController,
      Key? key})
      : super(key: key);
  final KidsModel kidsModel;
  final Animation<Offset> detailsAnimation;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SlideTransition(
          position: detailsAnimation,
          child: FadeTransition(
            opacity:
                animationController.drive(CurveTween(curve: Curves.easeOut)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.padding_small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kidsModel.title,
                    style: TextStyles.textBold.copyWith(
                      color: AppColors.black,
                      fontSize: Dimens.text_xxxlarge,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.space_normal,
                  ),
                  Text(
                    kidsModel.description,
                    style: TextStyles.textNormal.copyWith(
                      color: AppColors.black.withOpacity(Dimens.black_opacity),
                      fontSize: Dimens.text_medium,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.space_xxlarge,
                  ),
                  Text(
                    Strings.lifeSpan,
                    style: TextStyles.textBold.copyWith(
                      color: AppColors.black,
                      fontSize: Dimens.text_xxxlarge,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.space_normal,
                  ),
                  Text(
                    kidsModel.lifespan,
                    style: TextStyles.textNormal.copyWith(
                      color: AppColors.black.withOpacity(Dimens.black_opacity),
                      fontSize: Dimens.text_medium,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.space_xxlarge,
                  ),
                  Text(
                    Strings.speed,
                    style: TextStyles.textBold.copyWith(
                      color: AppColors.black,
                      fontSize: Dimens.text_xxxlarge,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.space_normal,
                  ),
                  Text(
                    kidsModel.speed,
                    style: TextStyles.textNormal.copyWith(
                      color: AppColors.black.withOpacity(Dimens.black_opacity),
                      fontSize: Dimens.text_medium,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.space_xxlarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderUiHero extends StatelessWidget {
  const _HeaderUiHero(
      {required this.kidsModel,
      required this.backArrowAnimation,
      required this.animationController,
      required this.function,
      Key? key})
      : super(key: key);
  final KidsModel kidsModel;
  final Animation<Offset> backArrowAnimation;
  final AnimationController animationController;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          transitionOnUserGestures: true,
          tag: kidsModel.color.toString() + kidsModel.id,
          child: Container(
            decoration: BoxDecoration(
              color: kidsModel.color.toString().stringToColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(Dimens.radius_xxxlarge),
                bottomRight: Radius.circular(Dimens.radius_xxxlarge),
              ),
            ),
          ),
        ),
        Center(
          child: Hero(
            transitionOnUserGestures: true,
            tag: kidsModel.imagePath + kidsModel.id,
            child: Image.asset(
              kidsModel.imagePath,
              width: Dimens.icon_size_xxxxxxxxlarge,
            ),
          ),
        ),
        _BackArrow(
          animationController: animationController,
          backArrowAnimation: backArrowAnimation,
          function: function,
        )
      ],
    );
  }
}

class _BackArrow extends StatelessWidget {
  const _BackArrow(
      {required this.backArrowAnimation,
      required this.animationController,
      required this.function,
      Key? key})
      : super(key: key);
  final Animation<Offset> backArrowAnimation;
  final AnimationController animationController;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimens.space_xxxlarge,
      left: Dimens.space_normal,
      child: SlideTransition(
        position: backArrowAnimation,
        child: FadeTransition(
          opacity: animationController.drive(CurveTween(curve: Curves.easeOut)),
          child: IconButton(
            onPressed: function,
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: Dimens.icon_size_xlarge,
            ),
          ),
        ),
      ),
    );
  }
}
