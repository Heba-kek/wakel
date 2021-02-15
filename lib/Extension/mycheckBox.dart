import 'package:flutter/material.dart';
class MyCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedIconColor;
  final Color checkedFillColor;
  final IconData checkedIcon;
  final Color uncheckedIconColor;
  final Color uncheckedFillColor;
//  final IconData uncheckedIcon;


  const MyCheckbox({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor = Colors.checkBox,
    this.checkedIcon = Icons.check,
    this.uncheckedIconColor = Colors.white,
    this.uncheckedFillColor =Colors.checkBox,
   // this.uncheckedIcon = Icons.close,
  }) : super(key: key);

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _checked;
  CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(MyCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;

    if (_checked == null) {
      _status = CheckStatus.empty;
    } else if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    Color fillColor;
    Color iconColor;
    IconData iconData;

    switch (_status) {
      case CheckStatus.empty:
        break;
      case CheckStatus.checked:
        fillColor = widget.checkedFillColor;
        iconColor = widget.checkedIconColor;
        iconData = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor;
        iconColor = widget.uncheckedIconColor;
      //  iconData = widget.uncheckedIcon;
        break;
    }

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: fillColor,

       // border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Icon(iconData, color: iconColor,size: 20,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _buildIcon(),
      onTap:  () => widget.onChanged(_checked == null ? true : !_checked),
    );
  }
}

enum CheckStatus {
  empty,
  checked,
  unchecked,
}
