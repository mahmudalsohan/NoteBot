import 'package:butex_notebot/models/notebird_hof.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    Future<NoteBirdHof> _hof = HttpService().getHOF();
    //
    _getHof() async {
      _hof = HttpService().getHOF();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Hall of Fame"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Container(
          child: FutureBuilder<NoteBirdHof>(
            future: _hof,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var hofData = snapshot.data;
                return RefreshIndicator(
                  onRefresh: _getHof,
                  child: ListView.separated(
                    itemCount: hofData!.hof.length,
                    itemBuilder: (context, index) {
                      var hofPlayer = hofData.hof[index];
                      return ListTile(
                        title: Text(hofPlayer.userName),
                        trailing: Text("${hofPlayer.score}"),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(color: Colors.grey),
                  ),
                );
              } else if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: _getHof,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: ErrorScreen(
                      errMsg: "Not Available",
                    ),
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: _getHof,
                  child: SkeletonLoading(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
