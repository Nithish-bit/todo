import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/app/global_widgets/bottom_sheet.dart';
import 'package:todo/app/global_widgets/expandable_container.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';
import 'package:todo/app/modules/home/views/past_tasks_view.dart';
import 'package:todo/app/theme/text_theme.dart';

class AllTasksView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme.of(context).scaffoldBackgroundColor,
        //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Tasks',
                    style: kSubHeadTextStyle.copyWith(
                        color: Theme.of(context).primaryColorDark),
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.history,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                    onPressed: () {
                      Get.to(() => PastTasksView());
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.012),
            GetBuilder<HomeController>(
              id: 1,
              builder: (controller) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final task = controller.commingTasks[index];
                      return Slidable(
                        // startActionPane: SlidableBehindActionPane(),
                        // actionExtentRatio: 0.2,
                        // controller : controller.slideC,
                        child: ExpandedContainer(
                          icon: task.taskImage,
                          title: task.taskTitle,
                          time: task.startTime,
                          desc: task.taskDesc,
                          ifDate: true,
                          date: DateFormat.yMMMd().format(task.taskDate!),
                        ),
                        startActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: Get.width * 0.05,
                                left: Get.width * 0.07),
                            child: Container(
                              padding: EdgeInsets.all(0),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColorLight,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    size: 26,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    controller.slideC!.close();
                                    Slidable.of(context)?.close();
                                    controller.preUpdateTask(task);
                                    showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return BottomSheetContent(
                                          buttonText: 'Update Task',
                                          onSubmit: () {
                                            controller.updateTask(task);
                                          },
                                        );
                                      },
                                    );
                                  }),
                            ),
                          ),
                        ]),
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: Get.width * 0.05,
                                  right: Get.width * 0.07),
                              child: Container(
                                padding: EdgeInsets.all(0),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColorLight,
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      size: 26,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                    onPressed: () {
                                      controller.slideC!.close();
                                      Slidable.of(context)?.close();
                                      controller.customDialogDel(context, task);
                                    }),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: controller.commingTasks.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
