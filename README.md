**Getx Architecture Template**


<pre>

# Project tree

├───main.dart
│
├───core
│   ├───base
│   │   └───model
│   │           base_error.dart
│   │           base_model.dart
│   │           IResponseModel.dart
│   │
│   ├───constants
│   │   ├───app
│   │   │       app_constants.dart
│   │   │
│   │   ├───endpoints
│   │   │       end_points.dart
│   │   │
│   │   ├───enums
│   │   │       app_theme_enum.dart
│   │   │       http_request_enum.dart
│   │   │
│   │   ├───image
│   │   │       images.dart
│   │   │       svg.dart
│   │   │
│   │   ├───routes
│   │   │       navigation_constants.dart
│   │   │
│   │   └───themes
│   │           colors.dart
│   │           themes.dart
│   │
│   ├───extension
│   │       context_extension.dart
│   │       network_exntension.dart
│   │       string_extension.dart
│   │
│   └───init
│       ├───cache
│       │       locale_manager.dart
│       │
│       ├───di
│       │       di.dart
│       │
│       ├───lang
│       │       locales.g.dart
│       │
│       ├───network
│       │   │   core_dio.dart
│       │   │   ICoreDio.dart
│       │   │   network_manager.dart
│       │   │   no_network.dart
│       │   │
│       │   └───network_core
│       │           core_operations.dart
│       │
│       ├───route
│       │       app_pages.dart
│       │
│       └───theme
│               theme_service.dart
│
├───feature
│   ├───home
│   │   ├───binding
│   │   │       home_binding.dart
│   │   │
│   │   ├───controller
│   │   │       home_controller.dart
│   │   │
│   │   ├───model
│   │   │       user.dart
│   │   │       user.g.dart
│   │   │
│   │   ├───service
│   │   │       home_service.dart
│   │   │       Ihome_service.dart
│   │   │
│   │   └───view
│   │           home_screen.dart
│   │
│   └───splash
│       ├───binding
│       │       splash_binding.dart
│       │
│       ├───controller
│       │       splash_controller.dart
│       │
│       └───view
│               splash_screen.dart
│
└───product
    ├───utils
    │       box_decoration.dart
    │       get_bottom_sheet.dart
    │       get_dialogs.dart
    │       get_snackbars.dart
    │       sizedbox.dart
    │       text_styles.dart
    │
    └───widget
            appbar.dart
            circle_progresbar.dart
            custom_button.dart
            custom_text_field.dart
            error_dialog_widget.dart
            
                
</pre> 
