import 'package:flutter/material.dart';

class MultiselectDialogItem<V>{
  final V value;
  final String label;
  MultiselectDialogItem({this.value,this.label});
}

class MultiselectDialog<V> extends StatefulWidget {
  MultiselectDialog({this.items, this.initialSelectedValues});
  final List<MultiselectDialogItem<V>> items;
  final List<V> initialSelectedValues;
  @override
  _MultiselectDialogState createState() => _MultiselectDialogState<V>();
}

class _MultiselectDialogState<V> extends State<MultiselectDialog<V>> {
  final _selectedValues = List<V>();

  @override
  void initState() {
    super.initState();
    if(widget.initialSelectedValues != null){
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked){
    setState(() {
      if(checked){
        _selectedValues.add(itemValue);
      } else{
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap(){
    Navigator.pop(context);
  }

  void _onSubmitTap(){
    Navigator.pop(context,_selectedValues.toList());
  }

  @override
  Widget build(BuildContext context) {
      return AlertDialog(
        title: Text('Wybierz'),
        contentPadding: EdgeInsets.only(top: 12.0),
        content: SingleChildScrollView(
          child: ListTileTheme(
            contentPadding: EdgeInsets.fromLTRB(13.0, 0.0, 24.0, 0.0),
            child: ListBody(
              children: widget.items.map(_buildItem).toList(),
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Anuluj"),
            onPressed: _onCancelTap,
          ),
          FlatButton(
            child: Text('OK'),
            onPressed: _onSubmitTap,
          )
        ],
      );
  }

  Widget _buildItem(MultiselectDialogItem<V> item){
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked)=> _onItemCheckedChange(item.value, checked),
    );
  }
}

