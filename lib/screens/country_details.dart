import 'package:countries_app/models/country_model.dart';
import 'package:countries_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountryDetailsView extends StatelessWidget {
  const CountryDetailsView({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
            color: Theme.of(context).disabledColor,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            country.name,
            style: Styles.headLine1TextStyle
                .copyWith(color: Theme.of(context).focusColor),
          ),
        ),
        body: ListView(
          children: [
            Container(
              child: Image.network('https://flagcdn.com/w320/ng.png'),
            ),
            Text(
              country.name,
              style: Styles.detailsTextStyle
                  .copyWith(color: Theme.of(context).highlightColor),
            ),
            Text(
              country.capital,
              style: Styles.detailsTextStyle
                  .copyWith(color: Theme.of(context).highlightColor),
            )
          ],
        ));
  }
}
