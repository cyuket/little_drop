import 'package:flutter/material.dart';
import 'package:little_drops/constants/assets.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/views/selection_view.dart';
import 'package:little_drops/ui/widgets/home_cards.dart';
import 'package:little_drops/viewModel/home_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, data, child) {
          return Scaffold(
            backgroundColor: AppColors().background,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Text("Services", style: header),
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: screenWidth(context),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Hello Michelle,', style: titleTextStyle),
                        verticalSpace(20),
                        Text(
                          'What would you like us to do for you today?',
                          style: subTitle,
                        ),
                        verticalSpace(20),
                      ],
                    ),
                  ),
                  verticalSpace(20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 8.0 / 8.0,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        padding: EdgeInsets.all(10.0),
                        itemBuilder: (context, index) => HomeCards(
                          iconImage: data.services[index].iconImage,
                          name: data.services[index].title,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SelectionView(
                                services: data.services[index],
                              ),
                            ),
                          ),
                        ),
                        itemCount: data.services.length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
