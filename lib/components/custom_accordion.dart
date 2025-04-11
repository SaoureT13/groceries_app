import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomAccordion extends StatelessWidget {
  final String headerText;
  final String expandedText;
  final Widget? custom;

  const CustomAccordion({
    super.key,
    required this.headerText,
    required this.expandedText,
    this.custom
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Column(
        children: [
          ScrollOnExpand(
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                hasIcon: true,
                iconColor: Colors.black,
                iconSize: 24,
              ),
              header: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    headerText,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  custom ?? SizedBox.shrink()
                ],
              ),
              collapsed: SizedBox.shrink(),
              expanded: Text(
                expandedText,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7C7C7C),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
