import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/level_and_term.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:flutter/material.dart';

class SyllabusLevelTermView extends StatelessWidget {
  final String dept;
  final String route;
  const SyllabusLevelTermView(
      {Key? key, required this.dept, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "$dept",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          child: FutureBuilder<List<LevelAndTerm>>(
              future: HttpService().getSyllabus(route),
              builder: (context, terms) {
                if (terms.hasData) {
                  var termsList = terms.data;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: termsList!.length,
                    itemBuilder: (context, index) {
                      var termsData = termsList[index];
                      return reusableListTile(
                        trailer: Icon(Icons.launch),
                        title: "${termsData.topic}",
                        onTap: () async {
                          await networkController.checkConnectivity();
                          if (networkController.isConnected.value)
                            UrlLauncher.openUrl(url: termsData.url);
                          else
                            customSnackBar(context, message: "No Network !");
                        },
                        context: context,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(color: Colors.grey),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
