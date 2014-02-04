/*  Copyright (c) Johnathan Jenkins
 *  Written by - Johnathan "ShaggyTwoDope" Jenkins, Valtam
 *  Version - 1.0 
 */

using Gtk;

private class program : Gtk.Window
{
  const string NAME         = "Lite Control Panel";
  const string ICON         = "preferences-desktop-theme";
  const int    MAX_ROW_APPS = 4;

  Gtk.Grid grid;
  static int app_number;
  static int row_number;

  public program()
  {

    grid = new Gtk.Grid();
    grid.set_column_spacing(25);
    grid.set_column_homogeneous(true);

    app_number = 0;
    row_number = 0;

    create_group(_("<b>Personal</b>"));
    create_entry(_("Appearance"),      "lxappearance",
"preferences-desktop-theme",     _("Customize Look and Feel"));
    create_entry(_("Other Personal Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));
    create_entry(_("Other Personal Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));
    create_entry(_("Other Personal Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));
    create_entry(_("Other Personal Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));
    create_entry(_("Other Personal Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));

    create_group(_("<b>Hardware</b>"));
    create_entry(_("Other Hardware Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));
    create_entry(_("Other Hardware Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));
    create_entry(_("Other Hardware Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));
    create_entry(_("Other Hardware Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));

    create_group(_("<b>System</b>"));
    create_entry(_("Task Manager"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));
    create_entry(_("Other System Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));
    create_entry(_("Other System Item"),    "leafpad",
"utilities-system-monitor",      _("Manage running processes"));

    var window = new Gtk.Window();
    window.window_position = WindowPosition.CENTER;
    window.add(grid);
    window.set_resizable(false);
    window.set_border_width(10);
    window.set_icon_name(ICON);
    window.set_title(NAME);
    window.show_all();
    window.destroy.connect(Gtk.main_quit);
  }



  private void create_group(string label)
  {
    var group_name = new Gtk.Label(label);
    group_name.set_use_markup(true);
    group_name.set_alignment(0, 1);

    if (row_number != 0)
    {
      group_name.height_request = 50;
    }

    app_number = 0;
    row_number = row_number + 2;
    grid.attach(group_name, app_number, row_number, 1, 1);

    row_number = row_number + 1;
  }


  private void create_entry(string label, string appname, string icon,
string tooltip)
  {
    if (app_number == MAX_ROW_APPS)
    {
      app_number = 0;
      row_number = row_number + 2;
    }

    var entry_image = new Gtk.Image.from_icon_name(icon, Gtk.IconSize.DND);
    entry_image.set_pixel_size(73);

    var entry_button = new Button();
    entry_button.set_image(entry_image);
    entry_button.set_tooltip_text(tooltip);
    entry_button.clicked.connect(() => { button_item_clicked(appname); });
    set_button_size_relief_focus(entry_button);
    grid.attach(entry_button, app_number, row_number, 1, 1);

    var entry_label = new Label(label);
    grid.attach(entry_label, app_number, (row_number + 1), 1, 1);

    app_number++;
  }

  private void button_item_clicked(string item_name)
  {
    try
    {
      Process.spawn_command_line_async(item_name);
    }
    catch (GLib.Error e)
    {
      stderr.printf ("%s\n", e.message);
    }
  }

  private void set_button_size_relief_focus(Gtk.Button button_name)
  {
    button_name.set_relief(ReliefStyle.NONE);
    button_name.height_request = 86;
    button_name.set_image_position(Gtk.PositionType.TOP);
    button_name.set_can_focus(false);
  }


  public static int main (string[] args)
  {
    Gtk.init(ref args);
    new program();
    Gtk.main();
    return 0;
  }
}
