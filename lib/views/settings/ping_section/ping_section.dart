import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/views/settings/ping_section/ping_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constants/controller.dart';

class PingSection extends GetView<PingController> {
  const PingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<PingController>(PingController());
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Active :',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Obx(
                () => DropdownButton(
                    underline: SizedBox(),
                    value: appController.selectedServer.value,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: controller.servers.map((String server) {
                      return DropdownMenuItem(
                          value: server, child: Text(server));
                    }).toList(),
                    onChanged: (String? newValue) {
                      appController.selectedServer.value = newValue!;
                      GetStorage().write(GetStorageKey.ACTIVE_SERVER,
                          appController.selectedServer.value);
                      networkController.getSelectedBaseURL();
                    }),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "*Switch to the server that has lower ping for better experience",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 20),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildServerDetails(title: '1', ping: controller.pingS1.value),
              _buildServerDetails(title: '2', ping: controller.pingS2.value),
            ],
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            controller.getPing(controller.server1);
            controller.getPing(controller.server2);
          },
          child: Text('Refresh'),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  _buildServerDetails({
    required String title,
    required int ping,
  }) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          'Server $title',
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(height: 10),
        Text(
          'ping : $ping ms',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
