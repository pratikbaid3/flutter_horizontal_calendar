#ifndef FLUTTER_PLUGIN_HORIZONTAL_CALENDAR_PLUGIN_H_
#define FLUTTER_PLUGIN_HORIZONTAL_CALENDAR_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace horizontal_calendar {

class HorizontalCalendarPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  HorizontalCalendarPlugin();

  virtual ~HorizontalCalendarPlugin();

  // Disallow copy and assign.
  HorizontalCalendarPlugin(const HorizontalCalendarPlugin&) = delete;
  HorizontalCalendarPlugin& operator=(const HorizontalCalendarPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace horizontal_calendar

#endif  // FLUTTER_PLUGIN_HORIZONTAL_CALENDAR_PLUGIN_H_
