import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/appImage.dart';
import '../../models/task_model.dart';
import '../../providers/addEventScreenProvider.dart';
import '../../tabs/homeTap/chipsHomeTab.dart';

class AddEventScreen extends StatelessWidget {
  AddEventScreen({super.key});

  static const String routName = "AddEventScreen";
  List<String>categories = [
    Appimage.birthday,
    Appimage.bookClub,
    Appimage.exhibition,
    Appimage.meeting,
    Appimage.sport,
  ];
  List<String>categoriesDark = [
    Appimage.birthdayDark,
    Appimage.bookClubDark,
    Appimage.exhibitionDark,
    Appimage.meetingDark,
    Appimage.sportDark,
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    chips = [
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.sport,
    ];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddEventScreenProvider(),),
      ],
      builder: (context, child) {
        var titleController=TextEditingController();
        var descriptionController=TextEditingController();
        // DateTime selectedDate = DateTime.now();
        var addEventScreenProvider = context.watch<AddEventScreenProvider>();
        return SafeArea(child: Scaffold(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .onSecondary,
          appBar: AppBar(
            // todo : fix arow back icon
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              //
              // AssetImage(ThemeMode.light==themeProvider.themeMode?Appimage.arrowBackIcon:Appimage.arrowBackIconDark))
              icon: Icon(Icons.arrow_back_ios_new, color: Theme
                  .of(context)
                  .colorScheme
                  .primary),

            ),
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .onSecondary,
            title: Text(AppLocalizations.of(context)!.addEvent, style: Theme
                .of(context)
                .textTheme
                .headlineSmall,),

          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(ThemeMode.light == themeProvider.themeMode
                      ? categories[addEventScreenProvider.selectedIndex]
                      : categoriesDark[addEventScreenProvider.selectedIndex]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Chipshometab(
                      onSelected: (index) {
                        addEventScreenProvider.changeSelectedIndex(index);
                      },
                      chips: chips,
                      selectedIndex: addEventScreenProvider.selectedIndex,

                    ),
                  ),
                  //todo : refacotr textfeild
                  Text(AppLocalizations.of(context)!.title, style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.eventTitle,
                        hintStyle: Theme
                            .of(context)
                            .textTheme
                            .bodySmall,
                        fillColor: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.description, style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: TextField(
                      maxLines: 5,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .eventDescription,
                        hintStyle: Theme
                            .of(context)
                            .textTheme
                            .bodySmall,
                        fillColor: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(width: 5, color: Theme
                                .of(context)
                                .colorScheme
                                .onError)
                        ),

                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 4,
                        children: [
                          ImageIcon(AssetImage(Appimage.calendar), color: Theme
                              .of(context)
                              .colorScheme
                              .primary,),
                          Text(AppLocalizations.of(context)!.eventDate,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,),
                        ],
                      ),
                      InkWell(
                        onTap: ()async{
                         DateTime? chosenDate = await showDatePicker(context: context,
                             initialDate: addEventScreenProvider.date,
                             firstDate: DateTime.now(),
                             lastDate: DateTime.now().add(Duration(days: 365)));
                         addEventScreenProvider.changeDate(chosenDate??DateTime.now());
                        },
                        
                        child: Text("${addEventScreenProvider.date.toString().substring(0,10)}",
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelLarge,),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 4,
                        children: [
                          ImageIcon(AssetImage(Appimage.clock), color: Theme
                              .of(context)
                              .colorScheme
                              .primary,),
                          Text(AppLocalizations.of(context)!.eventTime,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,),
                        ],
                      ),
                      InkWell(
                        onTap: ()async{
                          showTimePicker(context: context,
                              initialTime:TimeOfDay.now(),

                          );
                          //addEventScreenProvider.changeTime(chosenTime??TimeOfDay.now());
                        },
                        child: Text("${addEventScreenProvider.time.toString().substring(10,15)}",
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelLarge,),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  InkWell(
                    onTap: () {
                      addEventScreenProvider.addEvent(TaskModel(
                        category:chips[addEventScreenProvider.selectedIndex],
                          date:addEventScreenProvider.date,
                         // time:(addEventScreenProvider.time),
                          description:descriptionController.text ,
                          title:titleController.text ,
                      ));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.addEvent, style: Theme
                            .of(context)
                            .textTheme
                            .displayLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },

    );
  }

  List<String>chips = [];

}
