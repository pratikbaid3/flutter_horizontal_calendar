//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <simple_horizontal_calendar/horizontal_calendar_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) simple_horizontal_calendar_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "HorizontalCalendarPlugin");
  horizontal_calendar_plugin_register_with_registrar(simple_horizontal_calendar_registrar);
}
