#include "include/horizontal_calendar/horizontal_calendar_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "horizontal_calendar_plugin.h"

void HorizontalCalendarPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  horizontal_calendar::HorizontalCalendarPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
