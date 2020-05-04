import 'package:corona_data/app/shared/widgets/animations/washing_hands_animation.dart';
import 'package:flutter/material.dart';
import '../utils/localization/translation/base_translation_extension.i18n.dart';

class TryAgainWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const TryAgainWidget({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(width: 250,height: 250,child: WashingHandsAnimation(animation: WashingHandsAnimations.default_animation,fit: BoxFit.contain,)),
          Text(
            'We were unable to access the data'.i18n,
            style: TextStyle(
                color: Theme.of(context).primaryColorLight, fontSize: 16),
          ),
          Container(
            height: 10,
          ),
          FlatButton(
              onPressed: onPressed,
              textColor: Theme.of(context).primaryColorDark,
              color: Theme.of(context).primaryColorLight,
              child: Text('Try Again'.i18n)),
        ],
      ),
    );
  }
}
