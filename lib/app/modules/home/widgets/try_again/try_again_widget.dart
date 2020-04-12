import 'package:flutter/material.dart';

class TryAgainWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const TryAgainWidget({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Não foi possível acessar os dados.',
            style: TextStyle(
                color: Theme.of(context).primaryColorLight, fontSize: 16),
          ),
          Container(
            height: 10,
          ),
          FlatButton(
              onPressed: onPressed,
              color: Theme.of(context).accentColor,
              child: Text('Tentar novamente')),
        ],
      ),
    );
  }
}
