import 'package:flutter/material.dart';

import '../../../api/entities/kids_model.dart';
import '../../../core/utils/utils_import.dart';
import '../../../extension/context_extensions.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    required this.kidsModel,
    Key? key,
  }) : super(key: key);
  final KidsModel kidsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.height_xxxxxxlarge,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.padding_xxxlarge,
              right: Dimens.padding_medium,
            ),
            child: Hero(
              tag: kidsModel.color.toString() + kidsModel.id,
              child: Card(
                color: kidsModel.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.radius_xxxlarge),
                ),
                elevation: Dimens.elevation_normal,
                child: Container(
                  width: context.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.padding_xxxxlarge,
                      right: Dimens.padding_small,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kidsModel.title,
                          style: TextStyles.textBold.copyWith(
                            color: AppColors.white,
                            fontSize: Dimens.text_xxxlarge,
                          ),
                        ),
                        const SizedBox(
                          height: Dimens.space_normal,
                        ),
                        Text(
                          kidsModel.shortDescription,
                          style: TextStyles.textNormal.copyWith(
                            color: AppColors.white,
                            fontSize: Dimens.text_xlarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Hero(
              tag: kidsModel.imagePath + kidsModel.id,
              child: Image.asset(
                kidsModel.imagePath,
                width: Dimens.icon_size_xxxxlarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
