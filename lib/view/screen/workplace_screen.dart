import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pingo/config/routes.dart';
import 'package:pingo/controller/provider/workplace_provider.dart';
import 'package:pingo/view/widget/searchbar_widget.dart';

class WorkplaceScreen extends ConsumerStatefulWidget {
  const WorkplaceScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WorkplaceScreenState();
}

class _WorkplaceScreenState extends ConsumerState<WorkplaceScreen> {
  @override
  Widget build(BuildContext context) {
    final workplaceState = ref.watch(workplaceProvider);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Manage Workplaces',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                )),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: const Icon(FontAwesomeIcons.plus),
                onPressed: () {
                  //go to add_device route
                  Navigator.pushNamed(context, Routes().addWorkplace);
                },
              ),
            ],
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: SearchbarWidget(
                  onSearch: (String? value) {
                    //search device
                  },
                ),
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[400],
                  thickness: 0.2,
                ),
                shrinkWrap: true,
                itemCount: workplaceState.workplacesCount,
                itemBuilder: (BuildContext context, int index) {
                  final workplaces = workplaceState.workplaces;
                  return ListTile(
                    subtitle: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          workplaces[index].name!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(width: 200),
                        const Text(
                          'IP: ',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          workplaces[index].location!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(width: 200),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () async {},
                            icon: const Icon(Icons.check_circle_outline)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                      ],
                    ),
                    onTap: () {},
                  );
                },
              ),
            ],
          )

          // Container(
          //   decoration: const BoxDecoration(
          //     color: Colors.white,
          //   ),
          //   child:

          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       TextfieldWidget(
          //         hintText: 'Workplace Name',
          //         onChanged: (value) {},
          //       ),
          //       TextfieldWidget(
          //         hintText: 'Workplace Location',
          //         onChanged: (value) {},
          //       ),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
