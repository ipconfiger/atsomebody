import 'package:atsomebody/atsomebody.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    ItemHolder itemHolder;

    setUp(() {
      itemHolder = ItemHolder([
        SelectItem<String>('Max', 'a'),
        SelectItem<String>('Mars', 'b'),
        SelectItem<String>('Alex', 'c')], (matched){
          for (var item in matched){
            print('matched - k:${item.key} obj:${item..item}');
          }
      });
    });

    test('First Test', () {
      final text = "我给你说哈@m";
      for(var i in [1, 2, 3, 4, 5, 6, 7]){
        final input_txt = text.substring(0, i);
        itemHolder.processText(input_txt);
      }
      print(itemHolder.chooseItem('Max'));

    });
  });
}
