// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.

class SelectItem<T>{
  String _key;
  T _item;
  SelectItem(this._key, this._item);
  String get key => _key;
  T get item => _item;
}

typedef Filter(List<SelectItem> matched);

class ItemHolder<T>{
  List<SelectItem<T>> items;
  Filter filted;
  String currentText;
  ItemHolder(this.items, this.filted);
  
  processText(String text){
    this.currentText = text;
    final prefix = this.getPrefix(text);
    if (prefix.length > 0){
      List<SelectItem<T>> matched = List<SelectItem<T>>();
      for (var item in this.items){
        if (item.key.toLowerCase().contains(prefix)){
            matched.add(item);
        }
      }
      if (matched.length > 0){
        this.filted(matched);
      }
    }
  }

  String chooseItem(String key){
    return setPrefix(this.currentText, key);
  }

  String setPrefix(String text, String prefix){
    final sequnce = text.split('@');
    sequnce.removeLast();
    sequnce.add("@$prefix");
    return sequnce.join('');
  }

  String getPrefix(String text){
    final sequnce = text.split('@');
    if (sequnce.length<2){
      return '';
    }else{
      return sequnce.last;
    }
  }

}