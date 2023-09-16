import 'package:flutter/material.dart';

/// Represents an application icon with an associated image, name, and link.
class AppIcon {
  /// The image of the application icon.
  Image image;

  /// The name or title of the application.
  String name;

  /// The URI link associated with the application icon.
  Uri link;

  /// Creates a new instance of the [AppIcon] class with the specified image, name, and link.
  ///
  /// - [image]: The image of the application icon.
  /// - [name]: The name or title of the application.
  /// - [link]: The URI link associated with the application icon.
  AppIcon(this.image, this.name, this.link);
}

