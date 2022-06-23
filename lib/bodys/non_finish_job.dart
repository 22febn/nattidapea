// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nattidapea/models/job_model.dart';
import 'package:nattidapea/states/detail.dart';
import 'package:nattidapea/utility/my_calculate.dart';
import 'package:nattidapea/utility/my_constant.dart';
import 'package:nattidapea/widgets/show_progress.dart';

import 'package:nattidapea/widgets/show_text.dart';

class NonFinishJob extends StatefulWidget {
  final List<String> dataUserLogins;
  const NonFinishJob({
    Key? key,
    required this.dataUserLogins,
  }) : super(key: key);

  @override
  State<NonFinishJob> createState() => _NonFinishJobState();
}

class _NonFinishJobState extends State<NonFinishJob> {
  var dataUserLogin = <String>[];
  var jobModels = <JobModel>[];

  @override
  void initState() {
    super.initState();
    dataUserLogin = widget.dataUserLogins;
    readDatdaJob();
  }

  Future<void> readDatdaJob() async {
    String idOfficer = dataUserLogin[0];
    String path =
        'https://www.androidthai.in.th//egat/getUserWhereIdOfficernoey.php?isAdd=true&idOfficer=$idOfficer';

    await Dio().get(path).then((value) {
      print('value ===>> $value');

      var result = json.decode(value.data);
      for (var element in result) {
        JobModel jobModel = JobModel.fromMap(element);
        print('job ===> ${jobModel.job}');

        if (jobModel.status == 'start') {
          jobModels.add(jobModel);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ShowTitle(head: 'ชื่อพนักงาน :', value: dataUserLogin[1]),
          ShowTitle(head: 'ตำแหน่ง :', value: dataUserLogin[2]),
          jobModels.isEmpty
              ? const ShowProgress()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: jobModels.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Detail(jobModel: jobModels[index]),
                          )).then((value) {});
                    },
                    child: ShowTitle(
                      head: 'Job :',
                      value: jobModels[index].job,
                      detail:
                          MyCalculate().cutWord(word: jobModels[index].detail),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Card ShowTitle(
      {required String head, required String value, String? detail}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ShowText(
                    text: head,
                    textStyle: MyConstant().h2Style(),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ShowText(text: value),
                ),
              ],
            ),
            detail == null
                ? const SizedBox()
                : Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShowText(text: detail),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
