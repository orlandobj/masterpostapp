import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterpost/models/ColorFilterModel.dart';
import 'package:masterpost/models/FontData.dart';
import 'package:masterpost/models/FrameModel.dart';

List<String> getSmileys() {
  List emojis = <String>[];
  String emoji;

  emoji = '😀';
  emojis.add(emoji);
  emoji = '😁';
  emojis.add(emoji);
  emoji = '😂';
  emojis.add(emoji);
  emoji = '🤣';
  emojis.add(emoji);
  emoji = '😃';
  emojis.add(emoji);
  emoji = '😄';
  emojis.add(emoji);
  emoji = '😅';
  emojis.add(emoji);
  emoji = '😆';
  emojis.add(emoji);
  emoji = '😉';
  emojis.add(emoji);
  emoji = '😊';
  emojis.add(emoji);
  emoji = '😋';
  emojis.add(emoji);
  emoji = '😎';
  emojis.add(emoji);
  emoji = '😍';
  emojis.add(emoji);
  emoji = '😘';
  emojis.add(emoji);
  emoji = '🥰';
  emojis.add(emoji);
  emoji = '😗';
  emojis.add(emoji);
  emoji = '😙';
  emojis.add(emoji);
  emoji = '😚';
  emojis.add(emoji);
  emoji = '🙂️';
  emojis.add(emoji);
  emoji = '🤗';
  emojis.add(emoji);
  emoji = '🤩';
  emojis.add(emoji);
  emoji = '🤔';
  emojis.add(emoji);
  emoji = '🤔';
  emojis.add(emoji);
  emoji = '🤨';
  emojis.add(emoji);
  emoji = '😐';
  emojis.add(emoji);
  emoji = '😑';
  emojis.add(emoji);

  emoji = '😶';
  emojis.add(emoji);
  emoji = '🙄';
  emojis.add(emoji);
  emoji = '😏';
  emojis.add(emoji);

  emoji = '😣';
  emojis.add(emoji);
  emoji = '😥';
  emojis.add(emoji);

  emoji = '😮';
  emojis.add(emoji);
  emoji = '🤐';
  emojis.add(emoji);

  emoji = '😯';
  emojis.add(emoji);
  emoji = '😪';
  emojis.add(emoji);
  emoji = '😫';
  emojis.add(emoji);

  emoji = '😴';
  emojis.add(emoji);
  emoji = '😌';
  emojis.add(emoji);

  emoji = '😛';
  emojis.add(emoji);
  emoji = '😜';
  emojis.add(emoji);
  emoji = '😝';
  emojis.add(emoji);

  emoji = '🤤';
  emojis.add(emoji);

  emoji = '😒';
  emojis.add(emoji);
  emoji = '😓';
  emojis.add(emoji);
  emoji = '😔';
  emojis.add(emoji);
  emoji = '😕';
  emojis.add(emoji);
  emoji = '🙃';
  emojis.add(emoji);
  emoji = '🤑';
  emojis.add(emoji);
  emoji = '😲';
  emojis.add(emoji);

  emoji = '🙁';
  emojis.add(emoji);

  emoji = '😖';
  emojis.add(emoji);
  emoji = '😞';
  emojis.add(emoji);
  emoji = '😟';
  emojis.add(emoji);
  emoji = '😤';
  emojis.add(emoji);
  emoji = '😢';
  emojis.add(emoji);
  emoji = '😭';
  emojis.add(emoji);
  emoji = '😦';
  emojis.add(emoji);
  emoji = '😧';
  emojis.add(emoji);
  emoji = '😨';
  emojis.add(emoji);
  emoji = '😩';
  emojis.add(emoji);
  emoji = '🤯';
  emojis.add(emoji);
  emoji = '😬';
  emojis.add(emoji);

  emoji = '😰';
  emojis.add(emoji);
  emoji = '😱';
  emojis.add(emoji);
  emoji = '🥵';
  emojis.add(emoji);
  emoji = '🥶';
  emojis.add(emoji);
  emoji = '😳';
  emojis.add(emoji);
  emoji = '🤪';
  emojis.add(emoji);
  emoji = '😵';
  emojis.add(emoji);
  emoji = '😡';
  emojis.add(emoji);
  emoji = '😠';
  emojis.add(emoji);
  emoji = '🤬';
  emojis.add(emoji);
  emoji = '😷';
  emojis.add(emoji);
  emoji = '🤒';
  emojis.add(emoji);
  emoji = '🤕';
  emojis.add(emoji);
  emoji = '🤢';
  emojis.add(emoji);
  emoji = '🤮';
  emojis.add(emoji);
  emoji = '🤧';
  emojis.add(emoji);

  emoji = '😇';
  emojis.add(emoji);
  emoji = '🤠';
  emojis.add(emoji);
  emoji = '🤡';
  emojis.add(emoji);
  emoji = '🥳';
  emojis.add(emoji);
  emoji = '🥴';
  emojis.add(emoji);
  emoji = '🤥';
  emojis.add(emoji);

  emoji = '🤫';
  emojis.add(emoji);
  emoji = '🤭';
  emojis.add(emoji);
  emoji = '🤭';
  emojis.add(emoji);
  emoji = '🧐';
  emojis.add(emoji);

  emoji = '🤓';
  emojis.add(emoji);
  emoji = '😈';
  emojis.add(emoji);
  emoji = '👿';
  emojis.add(emoji);
  emoji = '👹';
  emojis.add(emoji);
  emoji = '👺';
  emojis.add(emoji);

  emoji = '💀';
  emojis.add(emoji);
  emoji = '👻';
  emojis.add(emoji);
  emoji = '👽';
  emojis.add(emoji);
  emoji = '🤖';
  emojis.add(emoji);
  emoji = '💩';
  emojis.add(emoji);
  emoji = '😺';
  emojis.add(emoji);
  emoji = '😸';
  emojis.add(emoji);

  emoji = '😹';
  emojis.add(emoji);
  emoji = '😻';
  emojis.add(emoji);
  emoji = '😼';
  emojis.add(emoji);
  emoji = '😽';
  emojis.add(emoji);
  emoji = '🙀';
  emojis.add(emoji);
  emoji = '😿';
  emojis.add(emoji);
  emoji = '😾';
  emojis.add(emoji);

  emoji = '😾';
  emojis.add(emoji);

  /// People and Fantasy
  emoji = '👶';
  emojis.add(emoji);
  emoji = '👧';
  emojis.add(emoji);
  emoji = '🧒';
  emojis.add(emoji);
  emoji = '👩';
  emojis.add(emoji);
  emoji = '🧑';
  emojis.add(emoji);
  emoji = '👨';
  emojis.add(emoji);
  emoji = '👵';
  emojis.add(emoji);
  emoji = '👴';
  emojis.add(emoji);
  emoji = '👲';
  emojis.add(emoji);
  emoji = '👳‍♀️‍️';
  emojis.add(emoji);
  emoji = '👳‍♂️️‍️';
  emojis.add(emoji);
  emoji = '🧕️️‍️';
  emojis.add(emoji);
  emoji = '🧔‍';
  emojis.add(emoji);
  emoji = '👱‍♂️️‍';
  emojis.add(emoji);
  emoji = '👱‍♀️️️‍';
  emojis.add(emoji);
  emoji = '👨‍🦰️️️‍';
  emojis.add(emoji);
  emoji = '👩‍🦰‍';
  emojis.add(emoji);
  emoji = '👨‍🦱‍‍';
  emojis.add(emoji);
  emoji = '👨‍🦲‍‍';
  emojis.add(emoji);
  emoji = '👩‍🦲‍‍';
  emojis.add(emoji);
  emoji = '👨‍🦳‍‍';
  emojis.add(emoji);
  emoji = '👩‍🦳‍‍';
  emojis.add(emoji);
  emoji = '🦸‍♀️‍‍';
  emojis.add(emoji);
  emoji = '🦸‍♂️️‍‍';
  emojis.add(emoji);
  emoji = '🦹‍♀️️️‍‍';
  emojis.add(emoji);
  emoji = '🦹‍♂️️️️‍‍';
  emojis.add(emoji);
  emoji = '👮‍♀️‍‍';
  emojis.add(emoji);
  emoji = '👮‍♂️️‍‍';
  emojis.add(emoji);
  emoji = '👷‍♀️️️‍‍';
  emojis.add(emoji);
  emoji = '👷‍♂️️️️‍‍';
  emojis.add(emoji);
  emoji = '💂‍♀️️️️️‍‍';
  emojis.add(emoji);
  emoji = '💂‍♂️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🕵️‍♀️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🕵️‍♂️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '👩‍⚕️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '👨‍⚕️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '👩‍🌾️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '👨‍🌾‍‍';
  emojis.add(emoji);
  emoji = '👩‍🍳‍‍';
  emojis.add(emoji);
  emoji = '👨‍🍳‍‍';
  emojis.add(emoji);
  emoji = '👩‍🎓‍‍';
  emojis.add(emoji);
  emoji = '👨‍🎓‍‍';
  emojis.add(emoji);

  emoji = '👩‍🎤‍‍';
  emojis.add(emoji);
  emoji = '👨‍🎤‍‍';
  emojis.add(emoji);
  emoji = '👩‍🏫‍‍';
  emojis.add(emoji);
  emoji = '👨‍🏫‍‍';
  emojis.add(emoji);

  emoji = '👩‍🏭‍‍';
  emojis.add(emoji);
  emoji = '👨‍🏭‍‍';
  emojis.add(emoji);
  emoji = '👩‍💻‍‍';
  emojis.add(emoji);
  emoji = '👨‍💻‍‍';
  emojis.add(emoji);
  emoji = '👩‍💼‍‍';
  emojis.add(emoji);
  emoji = '👨‍💼‍‍';
  emojis.add(emoji);

  emoji = '👩‍🔧‍‍';
  emojis.add(emoji);
  emoji = '👨‍🔧‍‍';
  emojis.add(emoji);
  emoji = '👩‍🔬‍‍';
  emojis.add(emoji);
  emoji = '👨‍🔬‍‍';
  emojis.add(emoji);
  emoji = '👩‍🎨‍‍';
  emojis.add(emoji);
  emoji = '👨‍🎨‍‍';
  emojis.add(emoji);

  emoji = '👩‍🚒‍‍';
  emojis.add(emoji);
  emoji = '👨‍🚒‍‍';
  emojis.add(emoji);
  emoji = '👩‍✈️‍‍';
  emojis.add(emoji);
  emoji = '👨‍✈️️‍‍';
  emojis.add(emoji);

  emoji = '👩‍🚀‍‍';
  emojis.add(emoji);
  emoji = '👨‍🚀‍‍';
  emojis.add(emoji);
  emoji = '👩‍⚖️‍‍';
  emojis.add(emoji);
  emoji = '👨‍⚖️️‍‍';
  emojis.add(emoji);
  emoji = '👰‍‍';
  emojis.add(emoji);
  emoji = '🤵‍‍';
  emojis.add(emoji);
  emoji = '👸‍‍';
  emojis.add(emoji);
  emoji = '🤴‍‍';
  emojis.add(emoji);
  emoji = '🤶‍‍';
  emojis.add(emoji);
  emoji = '🎅‍‍';
  emojis.add(emoji);

  emoji = '🧙‍♀️‍‍';
  emojis.add(emoji);
  emoji = '🧙‍♂️️‍‍';
  emojis.add(emoji);
  emoji = '🧝‍♀️️️‍‍';
  emojis.add(emoji);
  emoji = '🧝‍♂️‍‍';
  emojis.add(emoji);
  emoji = '🧛‍♀️️‍‍';
  emojis.add(emoji);
  emoji = '🧛‍♂️️️‍‍';
  emojis.add(emoji);
  emoji = '🧟‍♀️️️️‍‍';
  emojis.add(emoji);
  emoji = '🧟‍♂️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🧞‍♀️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🧞‍♂️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🧜‍♀️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🧜‍♂️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🧚‍♀️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🧚‍♂️️️️️️️️️️️‍‍';
  emojis.add(emoji);

  emoji = '👼️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🤰‍‍';
  emojis.add(emoji);
  emoji = '🤱‍‍';
  emojis.add(emoji);
  emoji = '🙇‍♀️‍‍';
  emojis.add(emoji);
  emoji = '🙇‍♂️‍‍';
  emojis.add(emoji);
  emoji = '💁‍♀️️‍‍';
  emojis.add(emoji);
  emoji = '💁‍♂️️️‍‍';
  emojis.add(emoji);
  emoji = '🙅‍♀️️️️‍‍';
  emojis.add(emoji);
  emoji = '🙅‍♂️‍‍';
  emojis.add(emoji);
  emoji = '🙆‍♀️️‍‍';
  emojis.add(emoji);
  emoji = '🙆‍♂️️️‍‍';
  emojis.add(emoji);
  emoji = '🙋‍♀️️️️‍‍';
  emojis.add(emoji);
  emoji = '🙋‍♂️‍‍';
  emojis.add(emoji);
  emoji = '🤦‍♀️️‍‍';
  emojis.add(emoji);
  emoji = '🤦‍♂️️️‍‍';
  emojis.add(emoji);
  emoji = '🤷‍♀️️️️‍‍';
  emojis.add(emoji);
  emoji = '🤷‍♂️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🙎‍♀️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🙎‍♂️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🙍‍♀️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🙍‍♂️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '💇‍♀️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '💇‍♂️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '💆‍♀️️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '💆‍♂️️️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🧖‍♀️️️️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🧖‍♂️️️️️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '💅️️️️️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🤳️️️️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '💃️️️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '🕺️️️️️️️️️️️️‍‍';
  emojis.add(emoji);
  emoji = '👯‍♀️‍‍';
  emojis.add(emoji);
  emoji = '👯‍♂️️‍‍';
  emojis.add(emoji);
  emoji = '🕴️️‍‍';
  emojis.add(emoji);
  emoji = '🚶‍♀️️‍‍';
  emojis.add(emoji);
  emoji = '🚶‍♂️️️‍‍';
  emojis.add(emoji);
  emoji = '🏃‍♀️️️️‍‍';
  emojis.add(emoji);
  emoji = '🏃‍♂️‍‍';
  emojis.add(emoji);
  emoji = '👫️‍‍';
  emojis.add(emoji);
  emoji = '👭‍‍';
  emojis.add(emoji);
  emoji = '👬‍‍';
  emojis.add(emoji);

  emoji = '💑‍‍';
  emojis.add(emoji);
  emoji = '👩‍❤️‍👩‍‍';
  emojis.add(emoji);
  emoji = '👨‍❤️‍👨‍‍';
  emojis.add(emoji);
  emoji = '💏‍‍';
  emojis.add(emoji);
  emoji = '👩‍❤️‍💋‍👩‍‍';
  emojis.add(emoji);
  emoji = '👨‍❤️‍💋‍👨‍‍';
  emojis.add(emoji);
  emoji = '👪‍‍';
  emojis.add(emoji);
  emoji = '👨‍👩‍👧‍‍';
  emojis.add(emoji);
  emoji = '👨‍👩‍👧‍👦‍‍';
  emojis.add(emoji);
  emoji = '👨‍👩‍👦‍👦‍‍';
  emojis.add(emoji);
  emoji = '👨‍👩‍👧‍👧‍‍';
  emojis.add(emoji);
  emoji = '👩‍👩‍👦‍‍';
  emojis.add(emoji);
  emoji = '👩‍👩‍👧‍‍';
  emojis.add(emoji);
  emoji = '👩‍👩‍👧‍👦‍‍';
  emojis.add(emoji);
  emoji = '👩‍👩‍👦‍👦‍‍';
  emojis.add(emoji);
  emoji = '👩‍👩‍👧‍👧‍‍';
  emojis.add(emoji);
  emoji = '👨‍👨‍👦‍‍';
  emojis.add(emoji);
  emoji = '👨‍👨‍👧‍‍';
  emojis.add(emoji);
  emoji = '👨‍👨‍👧‍👦‍‍';
  emojis.add(emoji);
  emoji = '👨‍👨‍👦‍👦‍‍';
  emojis.add(emoji);
  emoji = '👨‍👨‍👧‍👧‍‍';
  emojis.add(emoji);
  emoji = '👩‍👦‍‍';
  emojis.add(emoji);
  emoji = '👩‍👧‍‍';
  emojis.add(emoji);
  emoji = '👩‍👧‍👦‍‍';
  emojis.add(emoji);
  emoji = '👩‍👦‍👦‍‍';
  emojis.add(emoji);
  emoji = '👩‍👧‍👧‍‍';
  emojis.add(emoji);
  emoji = '👨‍👦‍‍';
  emojis.add(emoji);
  emoji = '👨‍👧‍‍';
  emojis.add(emoji);
  emoji = '👨‍👧‍👦‍‍';
  emojis.add(emoji);
  emoji = '👨‍👦‍👦‍‍';
  emojis.add(emoji);
  emoji = '👨‍👧‍👧‍‍';
  emojis.add(emoji);

  emoji = '🤲‍‍';
  emojis.add(emoji);
  emoji = '👐‍‍';
  emojis.add(emoji);
  emoji = '🙌‍‍';
  emojis.add(emoji);
  emoji = '👏‍‍';
  emojis.add(emoji);
  emoji = '🤝‍‍';
  emojis.add(emoji);
  emoji = '👍‍‍';
  emojis.add(emoji);
  emoji = '👎‍‍';
  emojis.add(emoji);
  emoji = '👊‍‍';
  emojis.add(emoji);
  emoji = '✊‍‍';
  emojis.add(emoji);
  emoji = '🤛‍‍';
  emojis.add(emoji);
  emoji = '🤜‍‍';
  emojis.add(emoji);
  emoji = '🤞‍‍';
  emojis.add(emoji);

  emoji = '✌️‍‍';
  emojis.add(emoji);
  emoji = '🤟️‍‍';
  emojis.add(emoji);
  emoji = '🤘‍‍';
  emojis.add(emoji);
  emoji = '👌‍‍';
  emojis.add(emoji);
  emoji = '👈‍‍';
  emojis.add(emoji);
  emoji = '👉‍‍';
  emojis.add(emoji);
  emoji = '👆‍‍';
  emojis.add(emoji);
  emoji = '👇‍‍';
  emojis.add(emoji);
  emoji = '☝️‍‍';
  emojis.add(emoji);
  emoji = '✋️‍‍';
  emojis.add(emoji);
  emoji = '🤚️‍‍';
  emojis.add(emoji);
  emoji = '🤚️‍‍';
  emojis.add(emoji);
  emoji = '🖐‍‍';
  emojis.add(emoji);
  emoji = '🖖‍‍';
  emojis.add(emoji);
  emoji = '👋‍‍';
  emojis.add(emoji);
  emoji = '🤙‍‍';
  emojis.add(emoji);
  emoji = '💪‍‍';
  emojis.add(emoji);
  emoji = '🦵‍‍';
  emojis.add(emoji);
  emoji = '🦶‍‍';
  emojis.add(emoji);
  emoji = '🖕‍‍';
  emojis.add(emoji);
  emoji = '✍️‍‍';
  emojis.add(emoji);
  emoji = '🙏️‍‍';
  emojis.add(emoji);
  emoji = '💍‍‍';
  emojis.add(emoji);
  emoji = '💄‍‍';
  emojis.add(emoji);
  emoji = '💋‍‍';
  emojis.add(emoji);
  emoji = '👄‍‍';
  emojis.add(emoji);
  emoji = '👅‍‍';
  emojis.add(emoji);

  emoji = '👂‍‍';
  emojis.add(emoji);
  emoji = '👃‍‍';
  emojis.add(emoji);
  emoji = '👣‍‍';
  emojis.add(emoji);
  emoji = '👁‍‍';
  emojis.add(emoji);
  emoji = '👀‍‍';
  emojis.add(emoji);
  emoji = '🧠‍‍';
  emojis.add(emoji);
  emoji = '🦴‍‍';
  emojis.add(emoji);
  emoji = '🦷‍‍';
  emojis.add(emoji);
  emoji = '🗣‍‍';
  emojis.add(emoji);
  emoji = '👤‍‍';
  emojis.add(emoji);
  emoji = '👥‍‍';
  emojis.add(emoji);

  emoji = '🧥‍‍';
  emojis.add(emoji);
  emoji = '👚‍‍';
  emojis.add(emoji);
  emoji = '👕‍‍';
  emojis.add(emoji);
  emoji = '👖‍‍';
  emojis.add(emoji);
  emoji = '👔‍‍';
  emojis.add(emoji);
  emoji = '👗‍‍';
  emojis.add(emoji);
  emoji = '👙‍‍';
  emojis.add(emoji);
  emoji = '👘‍‍';
  emojis.add(emoji);
  emoji = '👠‍‍';
  emojis.add(emoji);
  emoji = '👡‍‍';
  emojis.add(emoji);
  emoji = '👢‍‍';
  emojis.add(emoji);
  emoji = '👞‍‍';
  emojis.add(emoji);
  emoji = '👟‍‍';
  emojis.add(emoji);
  emoji = '🥾‍‍';
  emojis.add(emoji);
  emoji = '🥿‍‍';
  emojis.add(emoji);
  emoji = '🧦‍‍';
  emojis.add(emoji);
  emoji = '🧤‍‍';
  emojis.add(emoji);
  emoji = '🧣‍‍';
  emojis.add(emoji);
  emoji = '🎩‍‍';
  emojis.add(emoji);
  emoji = '🧢‍‍';
  emojis.add(emoji);
  emoji = '👒‍‍';
  emojis.add(emoji);
  emoji = '🎓‍‍';
  emojis.add(emoji);
  emoji = '⛑‍‍';
  emojis.add(emoji);
  emoji = '👑‍‍';
  emojis.add(emoji);
  emoji = '👝‍‍';
  emojis.add(emoji);
  emoji = '👛‍‍';
  emojis.add(emoji);
  emoji = '👜‍‍';
  emojis.add(emoji);
  emoji = '💼‍‍';
  emojis.add(emoji);
  emoji = '🎒‍‍';
  emojis.add(emoji);
  emoji = '👓‍‍';
  emojis.add(emoji);
  emoji = '🕶‍‍';
  emojis.add(emoji);
  emoji = '🥽‍‍';
  emojis.add(emoji);
  emoji = '🥼‍‍';
  emojis.add(emoji);
  emoji = '🌂‍‍';
  emojis.add(emoji);
  emoji = '🧵‍‍';
  emojis.add(emoji);
  emoji = '🧶‍‍';
  emojis.add(emoji);

  /// Animals
  emoji = '🐶‍‍';
  emojis.add(emoji);
  emoji = '🐱‍‍';
  emojis.add(emoji);
  emoji = '🐭‍‍';
  emojis.add(emoji);
  emoji = '🐰‍‍';
  emojis.add(emoji);
  emoji = '🦊‍‍';
  emojis.add(emoji);
  emoji = '🦝‍‍';
  emojis.add(emoji);
  emoji = '🐻‍‍';
  emojis.add(emoji);
  emoji = '🦘‍‍';
  emojis.add(emoji);
  emoji = '🦡‍‍';
  emojis.add(emoji);
  emoji = '🐨‍‍';
  emojis.add(emoji);
  emoji = '🐯‍‍';
  emojis.add(emoji);
  emoji = '🦁‍‍';
  emojis.add(emoji);
  emoji = '🐼‍‍';
  emojis.add(emoji);
  emoji = '🐼‍‍';
  emojis.add(emoji);

  emoji = '🐮‍‍';
  emojis.add(emoji);
  emoji = '🐷‍‍';
  emojis.add(emoji);
  emoji = '🐽‍‍';
  emojis.add(emoji);
  emoji = '🐸‍‍';
  emojis.add(emoji);
  emoji = '🐵‍‍';
  emojis.add(emoji);
  emoji = '🙈‍‍';
  emojis.add(emoji);
  emoji = '🙉‍‍';
  emojis.add(emoji);
  emoji = '🙊‍‍';
  emojis.add(emoji);
  emoji = '🐒‍‍';
  emojis.add(emoji);
  emoji = '🐔‍‍';
  emojis.add(emoji);
  emoji = '🐧‍‍';
  emojis.add(emoji);
  emoji = '🐦‍‍';
  emojis.add(emoji);
  emoji = '🐤‍‍';
  emojis.add(emoji);
  emoji = '🐣‍‍';
  emojis.add(emoji);
  emoji = '🐥‍‍';
  emojis.add(emoji);
  emoji = '🦆‍‍';
  emojis.add(emoji);
  emoji = '🦢‍‍';
  emojis.add(emoji);
  emoji = '🦅‍‍';
  emojis.add(emoji);
  emoji = '🦉‍‍';
  emojis.add(emoji);
  emoji = '🦚‍‍';
  emojis.add(emoji);
  emoji = '🦜‍‍';
  emojis.add(emoji);
  emoji = '🦇‍‍';
  emojis.add(emoji);
  emoji = '🐺‍‍';
  emojis.add(emoji);
  emoji = '🐗‍‍';
  emojis.add(emoji);
  emoji = '🐴‍‍';
  emojis.add(emoji);
  emoji = '🦄‍‍';
  emojis.add(emoji);
  emoji = '🐝‍‍';
  emojis.add(emoji);
  emoji = '🐛‍‍';
  emojis.add(emoji);
  emoji = '🦋‍‍';
  emojis.add(emoji);
  emoji = '🐌‍‍';
  emojis.add(emoji);
  emoji = '🐚‍‍';
  emojis.add(emoji);
  emoji = '🐞‍‍';
  emojis.add(emoji);
  emoji = '🐜‍‍';
  emojis.add(emoji);
  emoji = '🦗‍‍';
  emojis.add(emoji);
  emoji = '🕷‍‍';
  emojis.add(emoji);
  emoji = '🕸‍‍';
  emojis.add(emoji);
  emoji = '🦂‍‍';
  emojis.add(emoji);
  emoji = '🦟‍‍';
  emojis.add(emoji);
  emoji = '🦠‍‍';
  emojis.add(emoji);
  emoji = '🐢‍‍';
  emojis.add(emoji);
  emoji = '🐍‍‍';
  emojis.add(emoji);
  emoji = '🦎‍‍';
  emojis.add(emoji);
  emoji = '🦖‍‍';
  emojis.add(emoji);
  emoji = '🦕‍‍';
  emojis.add(emoji);
  emoji = '🐙‍‍';
  emojis.add(emoji);
  emoji = '🦑‍‍';
  emojis.add(emoji);
  emoji = '🦐‍‍';
  emojis.add(emoji);
  emoji = '🦀‍‍';
  emojis.add(emoji);
  emoji = '🐡‍‍';
  emojis.add(emoji);
  emoji = '🐠‍‍';
  emojis.add(emoji);
  emoji = '🐟‍‍';
  emojis.add(emoji);
  emoji = '🐬‍‍';
  emojis.add(emoji);
  emoji = '🐳‍‍';
  emojis.add(emoji);
  emoji = '🐋‍‍';
  emojis.add(emoji);
  emoji = '🦈‍‍';
  emojis.add(emoji);
  emoji = '🐊‍‍';
  emojis.add(emoji);
  emoji = '🐅‍‍';
  emojis.add(emoji);
  emoji = '🐆‍‍';
  emojis.add(emoji);
  emoji = '🦓‍‍';
  emojis.add(emoji);
  emoji = '🦍‍‍';
  emojis.add(emoji);
  emoji = '🐘‍‍';
  emojis.add(emoji);
  emoji = '🦏‍‍';
  emojis.add(emoji);
  emoji = '🦛‍‍';
  emojis.add(emoji);
  emoji = '🐪‍‍';
  emojis.add(emoji);
  emoji = '🐫‍‍';
  emojis.add(emoji);
  emoji = '🦙‍‍';
  emojis.add(emoji);
  emoji = '🦒‍‍';
  emojis.add(emoji);
  emoji = '🐃‍‍';
  emojis.add(emoji);
  emoji = '🐂‍‍';
  emojis.add(emoji);
  emoji = '🐄‍‍';
  emojis.add(emoji);
  emoji = '🐎‍‍';
  emojis.add(emoji);
  emoji = '🐖‍‍';
  emojis.add(emoji);
  emoji = '🐏‍‍';
  emojis.add(emoji);
  emoji = '🐐‍‍';
  emojis.add(emoji);
  emoji = '🦌‍‍';
  emojis.add(emoji);
  emoji = '🐕‍‍';
  emojis.add(emoji);
  emoji = '🐩‍‍';
  emojis.add(emoji);
  emoji = '🐈‍‍';
  emojis.add(emoji);
  emoji = '🐓‍‍';
  emojis.add(emoji);
  emoji = '🦃‍‍';
  emojis.add(emoji);
  emoji = '🕊‍‍';
  emojis.add(emoji);
  emoji = '🐇‍‍';
  emojis.add(emoji);
  emoji = '🐁‍‍';
  emojis.add(emoji);
  emoji = '🐀‍‍';
  emojis.add(emoji);
  emoji = '🐿‍‍';
  emojis.add(emoji);
  emoji = '🦔‍‍';
  emojis.add(emoji);
  emoji = '🐾‍';
  emojis.add(emoji);
  emoji = '🐉‍';
  emojis.add(emoji);
  emoji = '🐲‍';
  emojis.add(emoji);
  emoji = '🌵‍';
  emojis.add(emoji);
  emoji = '🎄‍';
  emojis.add(emoji);
  emoji = '🌲‍';
  emojis.add(emoji);
  emoji = '🌳‍';
  emojis.add(emoji);
  emoji = '🌴‍';
  emojis.add(emoji);
  emoji = '🌱‍';
  emojis.add(emoji);
  emoji = '🌿‍';
  emojis.add(emoji);
  emoji = '☘️‍';
  emojis.add(emoji);
  emoji = '🎍️‍';
  emojis.add(emoji);
  emoji = '🎋️‍';
  emojis.add(emoji);
  emoji = '🍃‍';
  emojis.add(emoji);
  emoji = '🍂‍';
  emojis.add(emoji);
  emoji = '🍁‍';
  emojis.add(emoji);
  emoji = '🍄‍';
  emojis.add(emoji);
  emoji = '🌾️‍';
  emojis.add(emoji);
  emoji = '💐️‍';
  emojis.add(emoji);
  emoji = '🌷️‍';
  emojis.add(emoji);
  emoji = '🌹‍';
  emojis.add(emoji);
  emoji = '🥀‍';
  emojis.add(emoji);
  emoji = '🌺‍';
  emojis.add(emoji);
  emoji = '🌸‍';
  emojis.add(emoji);
  emoji = '🌼‍';
  emojis.add(emoji);
  emoji = '🌻️‍';
  emojis.add(emoji);
  emoji = '🌞‍';
  emojis.add(emoji);
  emoji = '🌝‍';
  emojis.add(emoji);
  emoji = '🌛‍';
  emojis.add(emoji);
  emoji = '🌜‍';
  emojis.add(emoji);
  emoji = '🌚‍';
  emojis.add(emoji);
  emoji = '🌕‍';
  emojis.add(emoji);
  emoji = '🌖‍';
  emojis.add(emoji);
  emoji = '🌗‍';
  emojis.add(emoji);
  emoji = '🌘‍';
  emojis.add(emoji);
  emoji = '🌑‍';
  emojis.add(emoji);
  emoji = '🌒‍';
  emojis.add(emoji);
  emoji = '🌔‍';
  emojis.add(emoji);
  emoji = '🌙‍';
  emojis.add(emoji);
  emoji = '🌎‍';
  emojis.add(emoji);
  emoji = '🌍‍';
  emojis.add(emoji);
  emoji = '🌏‍';
  emojis.add(emoji);
  emoji = '💫‍';
  emojis.add(emoji);
  emoji = '⭐️‍';
  emojis.add(emoji);
  emoji = '🌟️‍';
  emojis.add(emoji);
  emoji = '✨️‍';
  emojis.add(emoji);
  emoji = '⚡️️‍';
  emojis.add(emoji);
  emoji = '☄️️️‍';
  emojis.add(emoji);
  emoji = '💥️️️‍';
  emojis.add(emoji);
  emoji = '🔥‍';
  emojis.add(emoji);
  emoji = '🌪‍';
  emojis.add(emoji);
  emoji = '🌈‍';
  emojis.add(emoji);
  emoji = '☀️‍';
  emojis.add(emoji);
  emoji = '🌤️‍';
  emojis.add(emoji);
  emoji = '⛅️️‍';
  emojis.add(emoji);
  emoji = '🌥️️‍';
  emojis.add(emoji);
  emoji = '☁️️‍';
  emojis.add(emoji);
  emoji = '🌦️️‍';
  emojis.add(emoji);
  emoji = '🌧️‍';
  emojis.add(emoji);
  emoji = '⛈‍';
  emojis.add(emoji);
  emoji = '🌩‍';
  emojis.add(emoji);
  emoji = '🌨‍';
  emojis.add(emoji);
  emoji = '❄️‍';
  emojis.add(emoji);
  emoji = '☃️️‍';
  emojis.add(emoji);
  emoji = '⛄️️️‍';
  emojis.add(emoji);
  emoji = '🌬️️️‍';
  emojis.add(emoji);
  emoji = '💨️️️‍';
  emojis.add(emoji);
  emoji = '💧️️️‍';
  emojis.add(emoji);
  emoji = '💦️️️‍';
  emojis.add(emoji);
  emoji = '☔️️️️‍';
  emojis.add(emoji);
  emoji = '☂️️️️️‍';
  emojis.add(emoji);
  emoji = '🌊️️️️️‍';
  emojis.add(emoji);
  emoji = '🌫️️️️‍';
  emojis.add(emoji);

  /// Foods
  emoji = '🍏‍';
  emojis.add(emoji);
  emoji = '🍎‍';
  emojis.add(emoji);
  emoji = '🍐‍';
  emojis.add(emoji);
  emoji = '🍊‍';
  emojis.add(emoji);
  emoji = '🍋‍';
  emojis.add(emoji);
  emoji = '🍌‍';
  emojis.add(emoji);
  emoji = '🍉‍';
  emojis.add(emoji);
  emoji = '🍇‍';
  emojis.add(emoji);
  emoji = '🍓‍';
  emojis.add(emoji);
  emoji = '🍈‍';
  emojis.add(emoji);
  emoji = '🍒‍';
  emojis.add(emoji);
  emoji = '🍑‍';
  emojis.add(emoji);
  emoji = '🍍‍';
  emojis.add(emoji);
  emoji = '🥭‍';
  emojis.add(emoji);
  emoji = '🥥‍';
  emojis.add(emoji);
  emoji = '🥝‍';
  emojis.add(emoji);
  emoji = '🍅‍';
  emojis.add(emoji);
  emoji = '🍆‍';
  emojis.add(emoji);
  emoji = '🥑‍';
  emojis.add(emoji);
  emoji = '🥦‍';
  emojis.add(emoji);
  emoji = '🥒‍';
  emojis.add(emoji);
  emoji = '🥬‍';
  emojis.add(emoji);
  emoji = '🌶‍';
  emojis.add(emoji);
  emoji = '🌽‍';
  emojis.add(emoji);
  emoji = '🥕‍';
  emojis.add(emoji);
  emoji = '🥔‍';
  emojis.add(emoji);
  emoji = '🍠‍';
  emojis.add(emoji);
  emoji = '🥐‍';
  emojis.add(emoji);
  emoji = '🍞‍';
  emojis.add(emoji);
  emoji = '🥖‍';
  emojis.add(emoji);
  emoji = '🥨‍';
  emojis.add(emoji);
  emoji = '🥯‍';
  emojis.add(emoji);
  emoji = '🧀‍';
  emojis.add(emoji);
  emoji = '🥚‍';
  emojis.add(emoji);
  emoji = '🍳‍';
  emojis.add(emoji);
  emoji = '🥞‍';
  emojis.add(emoji);
  emoji = '🥓‍';
  emojis.add(emoji);
  emoji = '🥩‍';
  emojis.add(emoji);
  emoji = '🍗‍';
  emojis.add(emoji);
  emoji = '🍖‍';
  emojis.add(emoji);
  emoji = '🌭‍';
  emojis.add(emoji);
  emoji = '🍔‍';
  emojis.add(emoji);
  emoji = '🍟‍';
  emojis.add(emoji);
  emoji = '🍕‍';
  emojis.add(emoji);
  emoji = '🥪‍';
  emojis.add(emoji);
  emoji = '🥙‍';
  emojis.add(emoji);
  emoji = '🌮‍';
  emojis.add(emoji);
  emoji = '🌯‍';
  emojis.add(emoji);
  emoji = '🥗‍';
  emojis.add(emoji);
  emoji = '🥘‍';
  emojis.add(emoji);
  emoji = '🥫‍';
  emojis.add(emoji);
  emoji = '🍝‍';
  emojis.add(emoji);
  emoji = '🍜‍';
  emojis.add(emoji);
  emoji = '🍲‍';
  emojis.add(emoji);
  emoji = '🍛‍';
  emojis.add(emoji);
  emoji = '🍣‍';
  emojis.add(emoji);
  emoji = '🍱‍';
  emojis.add(emoji);
  emoji = '🥟‍';
  emojis.add(emoji);
  emoji = '🍤‍';
  emojis.add(emoji);
  emoji = '🍙‍';
  emojis.add(emoji);
  emoji = '🍚‍';
  emojis.add(emoji);
  emoji = '🍘‍';
  emojis.add(emoji);
  emoji = '🍥‍';
  emojis.add(emoji);
  emoji = '🥮‍';
  emojis.add(emoji);
  emoji = '🥠‍';
  emojis.add(emoji);
  emoji = '🍢‍';
  emojis.add(emoji);
  emoji = '🍧‍';
  emojis.add(emoji);
  emoji = '🍨‍';
  emojis.add(emoji);
  emoji = '🍦‍';
  emojis.add(emoji);
  emoji = '🥧‍';
  emojis.add(emoji);
  emoji = '🍰‍';
  emojis.add(emoji);
  emoji = '🎂‍';
  emojis.add(emoji);
  emoji = '🍮‍';
  emojis.add(emoji);
  emoji = '🍭‍';
  emojis.add(emoji);
  emoji = '🍬‍';
  emojis.add(emoji);
  emoji = '🍫‍';
  emojis.add(emoji);
  emoji = '🍿‍';
  emojis.add(emoji);
  emoji = '🧂‍';
  emojis.add(emoji);
  emoji = '🍩‍';
  emojis.add(emoji);
  emoji = '🍪‍';
  emojis.add(emoji);
  emoji = '🌰‍';
  emojis.add(emoji);
  emoji = '🥜‍';
  emojis.add(emoji);
  emoji = '🍯‍';
  emojis.add(emoji);
  emoji = '🥛‍';
  emojis.add(emoji);
  emoji = '🍼‍';
  emojis.add(emoji);
  emoji = '☕️‍';
  emojis.add(emoji);
  emoji = '🍵️‍';
  emojis.add(emoji);

  emoji = '🥤️‍';
  emojis.add(emoji);
  emoji = '🍶‍';
  emojis.add(emoji);
  emoji = '🍺‍';
  emojis.add(emoji);
  emoji = '🍻‍';
  emojis.add(emoji);
  emoji = '🥂‍';
  emojis.add(emoji);
  emoji = '🍷‍';
  emojis.add(emoji);
  emoji = '🍸‍';
  emojis.add(emoji);
  emoji = '🍹‍';
  emojis.add(emoji);
  emoji = '🍾‍';
  emojis.add(emoji);
  emoji = '🥄‍';
  emojis.add(emoji);
  emoji = '🍴‍';
  emojis.add(emoji);
  emoji = '🍽‍';
  emojis.add(emoji);
  emoji = '🥣‍';
  emojis.add(emoji);
  emoji = '🥡‍';
  emojis.add(emoji);
  emoji = '🥢‍';
  emojis.add(emoji);

  /// Activity and Sports
  emoji = '⚽️‍';
  emojis.add(emoji);
  emoji = '🏀️‍';
  emojis.add(emoji);
  emoji = '🏈‍';
  emojis.add(emoji);
  emoji = '⚾️‍';
  emojis.add(emoji);
  emoji = '🥎️‍';
  emojis.add(emoji);
  emoji = '🏐️‍';
  emojis.add(emoji);
  emoji = '🏉‍';
  emojis.add(emoji);
  emoji = '🎾‍';
  emojis.add(emoji);
  emoji = '🥏‍';
  emojis.add(emoji);
  emoji = '🎱‍';
  emojis.add(emoji);
  emoji = '🏓‍';
  emojis.add(emoji);
  emoji = '🏸‍';
  emojis.add(emoji);
  emoji = '🥅‍';
  emojis.add(emoji);
  emoji = '🏒‍';
  emojis.add(emoji);
  emoji = '🏑‍';
  emojis.add(emoji);
  emoji = '🥍‍';
  emojis.add(emoji);
  emoji = '🏏‍';
  emojis.add(emoji);
  emoji = '⛳️‍';
  emojis.add(emoji);
  emoji = '🏹️‍';
  emojis.add(emoji);
  emoji = '🎣️‍';
  emojis.add(emoji);
  emoji = '🥊‍';
  emojis.add(emoji);
  emoji = '🥋‍';
  emojis.add(emoji);
  emoji = '🎽‍';
  emojis.add(emoji);
  emoji = '⛸‍';
  emojis.add(emoji);
  emoji = '🥌‍';
  emojis.add(emoji);
  emoji = '🛷‍';
  emojis.add(emoji);
  emoji = '🛹‍';
  emojis.add(emoji);
  emoji = '🎿‍';
  emojis.add(emoji);
  emoji = '⛷‍';
  emojis.add(emoji);
  emoji = '🏂‍';
  emojis.add(emoji);
  emoji = '🏋️‍♀️‍';
  emojis.add(emoji);
  emoji = '🏋🏼‍♀️‍';
  emojis.add(emoji);
  emoji = '🏋🏽‍♀️️‍';
  emojis.add(emoji);
  emoji = '🏋🏾‍♀️️️‍';
  emojis.add(emoji);

  emoji = '🏋🏿‍♀️️️️‍';
  emojis.add(emoji);
  emoji = '🏋️‍♂️️️️‍';
  emojis.add(emoji);
  emoji = '🏋🏻‍♂️️️️‍';
  emojis.add(emoji);
  emoji = '🏋🏼‍♂️️️️‍';
  emojis.add(emoji);
  emoji = '🏋🏽‍♂️️️️‍';
  emojis.add(emoji);
  emoji = '🏋🏾‍♂️️️️‍';
  emojis.add(emoji);
  emoji = '🏋🏿‍♂️️️️‍';
  emojis.add(emoji);
  emoji = '🤼‍♀️️️️‍';
  emojis.add(emoji);
  emoji = '🤼‍♂️️️️‍';
  emojis.add(emoji);
  emoji = '🤸‍♀️️️️‍';
  emojis.add(emoji);
  emoji = '🤸🏻‍♀️️️️‍';
  emojis.add(emoji);
  emoji = '🤸🏼‍♀️️️️‍';
  emojis.add(emoji);
  emoji = '🤸🏽‍♀️️️️‍';
  emojis.add(emoji);
  emoji = '🤸🏿‍♀️️️️️‍';
  emojis.add(emoji);
  emoji = '🤸‍♂️️️️‍';
  emojis.add(emoji);
  emoji = '🤸🏻‍♂️️️️‍';
  emojis.add(emoji);
  emoji = '🤸🏼‍♂️️️️️‍';
  emojis.add(emoji);

  emoji = '🤸🏽‍♂️️️️️️‍';
  emojis.add(emoji);
  emoji = '🤸🏾‍♂️️️️️️‍';
  emojis.add(emoji);
  emoji = '🤸🏿‍♂️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹️‍♀️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏻‍♀️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏼‍♀️️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏽‍♀️️️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏾‍♀️️️️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏿‍♀️️️️️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹️‍♂️️️️️️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏻‍♂️️️️️️️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏼‍♂️️️️️️️️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏽‍♂️️️️️️️️️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏾‍♂️️️️️️️️️️️️️️️️‍';
  emojis.add(emoji);
  emoji = '⛹🏿‍♂️‍';
  emojis.add(emoji);
  emoji = '🤺️‍';
  emojis.add(emoji);
  emoji = '🤾‍♀️‍';
  emojis.add(emoji);
  emoji = '🤾🏻‍♀️️‍';
  emojis.add(emoji);
  emoji = '🤾🏼‍♀️️️‍';
  emojis.add(emoji);

  emoji = '🤾🏾‍♀️️️️‍';
  emojis.add(emoji);

  return emojis;
}

List<String> getStickers() {
  List<String> list = [];

  list.add('images/stickers/4.png');
  list.add('images/stickers/7.png');
  list.add('images/stickers/8.png');
  list.add('images/stickers/10.png');
  list.add('images/stickers/11.png');
  list.add('images/stickers/12.png');
  list.add('images/stickers/13.png');
  list.add('images/stickers/14.png');
  list.add('images/stickers/15.png');
  list.add('images/stickers/16.png');
  list.add('images/stickers/17.png');
  list.add('images/stickers/18.png');
  list.add('images/stickers/19.png');
  list.add('images/stickers/20.png');
  list.add('images/stickers/21.png');
  list.add('images/stickers/22.png');
  list.add('images/stickers/23.png');
  list.add('images/stickers/24.png');
  list.add('images/stickers/25.png');
  list.add('images/stickers/26.png');
  list.add('images/stickers/27.png');
  list.add('images/stickers/28.png');
  list.add('images/stickers/29.png');
  list.add('images/stickers/30.png');
  list.add('images/stickers/31.png');
  list.add('images/stickers/32.png');
  list.add('images/stickers/33.png');
  list.add('images/stickers/34.png');
  list.add('images/stickers/35.png');
  list.add('images/stickers/36.png');
  list.add('images/stickers/38.png');
  list.add('images/stickers/39.png');
  list.add('images/stickers/40.png');
  list.add('images/stickers/41.png');
  list.add('images/stickers/42.png');
  list.add('images/stickers/43.png');
  list.add('images/stickers/44.png');
  list.add('images/stickers/45.png');
  list.add('images/stickers/46.png');
  list.add('images/stickers/47.png');
  list.add('images/stickers/48.png');
  list.add('images/stickers/49.png');
  list.add('images/stickers/50.png');
  list.add('images/stickers/51.png');
  list.add('images/stickers/52.png');
  list.add('images/stickers/53.png');
  list.add('images/stickers/54.png');
  list.add('images/stickers/55.png');
  list.add('images/stickers/56.png');
  list.add('images/stickers/57.png');
  list.add('images/stickers/58.png');
  list.add('images/stickers/59.png');
  list.add('images/stickers/60.png');
  list.add('images/stickers/61.png');
  list.add('images/stickers/62.png');
  list.add('images/stickers/63.png');
  list.add('images/stickers/64.png');
  list.add('images/stickers/65.png');
  list.add('images/stickers/66.png');
  list.add('images/stickers/67.png');
  list.add('images/stickers/68.png');
  list.add('images/stickers/69.png');
  list.add('images/stickers/70.png');
  list.add('images/stickers/71.png');
  list.add('images/stickers/72.png');
  list.add('images/stickers/73.png');
  list.add('images/stickers/74.png');
  list.add('images/stickers/75.png');
  list.add('images/stickers/76.png');
  list.add('images/stickers/77.png');
  list.add('images/stickers/78.png');
  list.add('images/stickers/79.png');
  list.add('images/stickers/80.png');
  list.add('images/stickers/81.png');
  list.add('images/stickers/82.png');
  list.add('images/stickers/83.png');
  list.add('images/stickers/84.png');
  list.add('images/stickers/85.png');
  list.add('images/stickers/86.png');
  list.add('images/stickers/87.png');
  list.add('images/stickers/88.png');
  list.add('images/stickers/89.png');
  list.add('images/stickers/90.png');
  list.add('images/stickers/Group.png');
  list.add('images/stickers/Group-glasses.png');
  list.add('images/stickers/Group-lol.png');
  list.add('images/stickers/Group-wtf.png');
  list.add('images/stickers/Group-2.png');
  list.add('images/stickers/Group-3.png');
  list.add('images/stickers/Group-4.png');
  list.add('images/stickers/Group-5.png');
  list.add('images/stickers/Group-6.png');
  list.add('images/stickers/Group-7.png');
  list.add('images/stickers/Group-8.png');
  list.add('images/stickers/Group 9.png');
  list.add('images/stickers/Group-laugh.png');
  list.add('images/stickers/XMLID-1.png');
  list.add('images/stickers/XMLID-4.png');
  list.add('images/stickers/XMLID-10.png');
  list.add('images/stickers/XMLID-12.png');
  list.add('images/stickers/XMLID-36.png');
  list.add('images/stickers/XMLID-40.png');
  list.add('images/stickers/XMLID-42.png');
  list.add('images/stickers/XMLID-55.png');
  list.add('images/stickers/XMLID-67.png');
  list.add('images/stickers/XMLID-68.png');
  list.add('images/stickers/XMLID-80.png');
  list.add('images/stickers/XMLID-90.png');
  list.add('images/stickers/XMLID-257.png');
  list.add('images/stickers/XMLID-115.png');
  list.add('images/stickers/XMLID-145.png');
  list.add('images/stickers/XMLID_127_.png');
  list.add('images/stickers/XMLID_150_.png');
  list.add('images/stickers/XMLID_165_.png');
  list.add('images/stickers/XMLID_255_.png');
  list.add('images/stickers/XMLID_343_.png');
  list.add('images/stickers/XMLID_401_.png');

  return list;
}

List<ColorFilterModel> getFilters() {
  List<ColorFilterModel> list = [];

  list.add(ColorFilterModel(name: 'Normal'));
  list.add(ColorFilterModel(name: 'Black & White', matrix: greyscaleMatrix));
  list.add(ColorFilterModel(name: 'Sepia', matrix: sepiaMatrix));
  list.add(ColorFilterModel(name: 'Vintage', matrix: vintageMatrix));
  list.add(ColorFilterModel(name: 'Sweet', matrix: sweetMatrix));
  list.add(ColorFilterModel(name: 'Milk', matrix: milkMatrix));
  list.add(ColorFilterModel(name: 'Hudson', matrix: hudsonMatrix));
  list.add(ColorFilterModel(
      name: 'Hudson', color: [Color(0x8C449BE0), Color(0x8C29C267)]));
  list.add(ColorFilterModel(
      name: 'Metro', color: [Color(0x8C5388CB), Color(0x8C5B54FA)]));
  list.add(ColorFilterModel(
      name: 'Paris', color: [Color(0x8C334d50), Color(0x8Ccbcaa5)]));
  list.add(ColorFilterModel(
      name: 'Oslo', color: [Color(0x8CEFEFBB), Color(0x8Cd4d3dd)]));
  list.add(ColorFilterModel(
      name: 'Lagos', color: [Color(0x8Cc21500), Color(0x8Cffc500)]));
  list.add(ColorFilterModel(
      name: 'Malbourne', color: [Color(0x8C1CD8D2), Color(0x8C93EDC7)]));
  list.add(ColorFilterModel(
      name: 'Jakarta',
      color: [Color(0x8C00416A), Color(0x8C799F0C), Color(0x8CFFE000)]));
  list.add(ColorFilterModel(
      name: 'Abu Dhabi', color: [Color(0x8C5F0A87), Color(0x8CA4508B)]));
  list.add(
      ColorFilterModel(name: 'Faded', color: [Colors.white54, Colors.white54]));
  list.add(ColorFilterModel(
      name: 'Soft', color: [Color(0x8C868F96), Color(0x8C596164)]));
  list.add(ColorFilterModel(
      name: 'Cool', color: [Color(0x8CFFECD2), Color(0x8CFCB69F)]));
  list.add(ColorFilterModel(
      name: 'Warm', color: [Color(0x8CFDFCFB), Color(0x8CE2D1C3)]));
  list.add(ColorFilterModel(
      name: 'Pale', color: [Color(0x8C42275a), Color(0x8C734b6d)]));

  return list;
}

List<double> sepiaMatrix = [
  0.39,
  0.769,
  0.189,
  0.0,
  0.0,
  0.349,
  0.686,
  0.168,
  0.0,
  0.0,
  0.272,
  0.534,
  0.131,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
];
List<double> greyscaleMatrix = [
  0.2126,
  0.7152,
  0.0722,
  0.0,
  0.0,
  0.2126,
  0.7152,
  0.0722,
  0.0,
  0.0,
  0.2126,
  0.7152,
  0.0722,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
];
List<double> vintageMatrix = [
  0.9,
  0.5,
  0.1,
  0.0,
  0.0,
  0.3,
  0.8,
  0.1,
  0.0,
  0.0,
  0.2,
  0.3,
  0.5,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
];
List<double> sweetMatrix = [
  1.0,
  0.0,
  0.2,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
];
List<double> milkMatrix = [
  0.0,
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.6,
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
];
List<double> hudsonMatrix = [
  0.2,
  0,
  0,
  0,
  0,
  0,
  0.78,
  0,
  0,
  0,
  0,
  0,
  0.78,
  0,
  0,
  0,
  0,
  0,
  1,
  0
];

List<ColorFilterModel> getColorFilters() {
  List<ColorFilterModel> list = [];

  list.add(ColorFilterModel());
  list.add(ColorFilterModel());
  list.add(ColorFilterModel());
  list.add(ColorFilterModel());
  list.add(ColorFilterModel());
  list.add(ColorFilterModel());
  list.add(ColorFilterModel());
  list.add(ColorFilterModel());
  list.add(ColorFilterModel());
  list.add(ColorFilterModel());
  list.add(ColorFilterModel());

  return list;
}

List<FrameModel> getFrameList() {
  List<FrameModel> list = [];

  list.add(FrameModel(name: 'No Frame', frame: ''));

  return list;
}

List<FontData> getFontFamilies() {
  List<FontData> list = [];

  list.add(FontData(
      fontFamily: GoogleFonts.nunito().fontFamily, fontName: 'Nunito'));
  list.add(FontData(
      fontFamily: GoogleFonts.roboto().fontFamily, fontName: 'Roboto'));
  list.add(FontData(
      fontFamily: GoogleFonts.dancingScript().fontFamily,
      fontName: 'Dancing Script'));
  list.add(FontData(
      fontFamily: GoogleFonts.architectsDaughter().fontFamily,
      fontName: 'Architects Daughter'));
  list.add(FontData(
      fontFamily: GoogleFonts.zillaSlab().fontFamily, fontName: 'Zilla Slab'));
  list.add(FontData(
      fontFamily: GoogleFonts.montserrat().fontFamily, fontName: 'Montserrat'));
  list.add(FontData(
      fontFamily: GoogleFonts.ubuntu().fontFamily, fontName: 'Ubuntu'));
  list.add(FontData(
      fontFamily: GoogleFonts.openSans().fontFamily, fontName: 'Open Sans'));
  list.add(FontData(
      fontFamily: GoogleFonts.oswald().fontFamily, fontName: 'Oswald'));
  list.add(FontData(
      fontFamily: GoogleFonts.poppins().fontFamily, fontName: 'Poppins'));
  list.add(FontData(
      fontFamily: GoogleFonts.oregano().fontFamily, fontName: 'Oregano'));
  list.add(FontData(
      fontFamily: GoogleFonts.notoSans().fontFamily, fontName: 'Noto Sans'));
  list.add(FontData(
      fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      fontName: 'Source Sans Pro'));
  list.add(FontData(
      fontFamily: GoogleFonts.titilliumWeb().fontFamily,
      fontName: 'Titillium Web'));
  list.add(FontData(
      fontFamily: GoogleFonts.bitter().fontFamily, fontName: 'Bitter'));
  list.add(FontData(
      fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
      fontName: 'IBM Plex Sans'));

  return list;
}
