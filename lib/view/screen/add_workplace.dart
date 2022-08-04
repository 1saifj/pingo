import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pingo/config/routes.dart';
import 'package:pingo/controller/provider/workplace_provider.dart';
import 'package:pingo/view/widget/searchbar_widget.dart';
import 'package:pingo/view/widget/textfield_widget.dart';

class AddWorkplace extends ConsumerStatefulWidget {
  const AddWorkplace({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddWorkplaceState();
}

class _AddWorkplaceState extends ConsumerState<AddWorkplace> {
  @override
  Widget build(BuildContext context) {
    final workplaceState = ref.watch(workplaceProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Workplaces',
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
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextfieldWidget(
                hintText: 'Workplace Name',
                onChanged: (value) {},
              ),
              TextfieldWidget(
                hintText: 'Workplace Location',
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
