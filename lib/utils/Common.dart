import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

extension IntExt on int {
  Size get size => Size(this.toDouble(), this.toDouble());
}
