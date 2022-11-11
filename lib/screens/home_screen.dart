import 'package:countries_app/models/country_model.dart';
import 'package:countries_app/screens/country_details.dart';
import 'package:countries_app/utils/app_layout.dart';
import 'package:countries_app/utils/app_styles.dart';
import 'package:countries_app/utils/dark_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Afganistan",
      "capital": "Kabul",
    },
    {
      "name": "Albanian",
      "capital": "Tirana",
    },
    {
      "name": "Algeria",
      "capital": "Algiers",
    },
    {
      "name": "Andorra",
      "capital": "Andorra la Vella",
    },
    {
      "name": "Angola",
      "capital": "Luana",
    },
    {
      "name": "Bahamas",
      "capital": "Nassau",
    },
    {
      "countryName": "Bahrain",
      "capital": "Manama",
    },
    {
      "name": "Bangladesh",
      "capital": "Dhaka",
    },
    {
      "name": "Barbados",
      "capital": "Bridgetown",
    },
    {
      "name": "Britain",
      "capital": "London",
    }
  ];
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    //IconData _icon = Icons.wb_sunny;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        controller: _scrollController,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Explore',
                          style: Styles.headLine2TextStyle
                              .copyWith(color: Theme.of(context).focusColor)),
                      Expanded(child: Container()),
                      Switch(
                          value: themeChange.darkTheme,
                          onChanged: (toggle) {
                            setState(() {
                              themeChange.darkTheme = toggle;
                            });
                          }),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          color: Theme.of(context).hoverColor,
                          size: 16,
                        ),
                        Expanded(child: Container()),
                        Text("Search Country",
                            style: Styles.searchTextStyle
                                .copyWith(color: Theme.of(context).hintColor)),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.web,
                              size: 20, color: Theme.of(context).canvasColor),
                          const Gap(10),
                          Text('EN',
                              style: Styles.searchTextStyle.copyWith(
                                  color: Theme.of(context).canvasColor)),
                        ],
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(Icons.filter_1,
                              size: 20, color: Theme.of(context).canvasColor),
                          const Gap(10),
                          Text(
                            'Filter',
                            style: Styles.searchTextStyle
                                .copyWith(color: Theme.of(context).canvasColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GroupedListView<Map<String, String>, String>(
                    shrinkWrap: true,
                    elements: data,
                    groupBy: (element) =>
                        element['name'].toString().substring(0, 1),
                    groupSeparatorBuilder: (String groupByValue) => SizedBox(
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          groupByValue.substring(0, 1),
                          textAlign: TextAlign.left,
                          style: Styles.regularTextStyle
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    itemBuilder: (context, Map<String, String> element) {
                      Country country = Country.fromJson(element);
                      return Column(
                        children: [
                          ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CountryDetailsView(
                                        country: country,
                                      );
                                    },
                                  ),
                                );
                              },
                              leading: const CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/lawalazeez.jpeg'),
                              ),
                              title: Text(
                                '${element['name']}',
                                style: Styles.regularTextStyle.copyWith(
                                    color: Theme.of(context).highlightColor),
                              ),
                              subtitle: Text(
                                '${element['capital']}',
                                style: Styles.regularTextStyle.copyWith(
                                    color: Theme.of(context).highlightColor),
                              )),
                          const Divider(
                            indent: 25,
                            thickness: 2,
                          )
                        ],
                      );
                    },
                    itemComparator: (item1, item2) =>
                        item1['name']!.compareTo(item2['name']!), // optional
                    useStickyGroupSeparators: true, // optional
                    floatingHeader: true, // optional
                    order: GroupedListOrder.ASC, // optional
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
