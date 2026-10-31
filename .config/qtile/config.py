# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


import os
import re
import socket
import subprocess
from typing import List  # noqa: F401
from libqtile import layout, bar, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen, Rule
from libqtile.lazy import lazy
from libqtile.widget import Spacer
#import arcobattery

#mod4 or mod = super key
mod = "mod1"
mod1 = "alt"
mod2 = "control"

home = os.path.expanduser('~')

@hook.subscribe.startup_once
def autostart():
    autoscript = os.path.expanduser('~/.config/qtile/autostart.sh')
    if os.path.isfile(autoscript):
        subprocess.Popen([autoscript])

@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

SCREENSHOT = os.path.expanduser("~/.config/qtile/scripts/screenshot.sh")

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    # Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    # Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    # Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    # Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "d", lazy.spawn('rofi -show drun -show-icons'), desc="Run rofi launcher"),
    Key([mod], "c", lazy.spawn('rofi -modi "clipboard:greenclip print" -show clipboard -run-command \'{cmd}\''), desc="Run clipboard manager"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key(
        [mod], "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle Fullscreen",
    ),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.screen.toggle_group(), desc="Toggle to last workspace"),
    Key([mod], "grave", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
	# Sound
    Key([], "XF86AudioMute", lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")),
	Key([mod], "b", lazy.hide_show_bar(position="bottom")),
    # Custom bindings
    Key([mod], "Return", lazy.spawn('alacritty'), desc="Launch terminal"),
    Key([], "Print", lazy.spawn(SCREENSHOT + " full"), desc="Screenshot full screen"),
    Key(["shift"], "Print", lazy.spawn(SCREENSHOT + " select"), desc="Screenshot region"),
    Key([mod], "Print", lazy.spawn(SCREENSHOT + " window"), desc="Screenshot focused window"),
    Key([mod], "p", lazy.spawn(SCREENSHOT + " select"), desc="Screenshot region"),

# Most of our keybindings are in sxhkd file - except these

# SUPER + FUNCTION KEYS

# SUPER + SHIFT KEYS

    Key([mod, "shift"], "r", lazy.restart()),


# RESIZE UP, DOWN, LEFT, RIGHT
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),


# FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),

# FLIP LAYOUT FOR BSP
#    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
#    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
#    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
#    Key([mod, "mod1"], "h", lazy.layout.flip_left()),

# # MOVE WINDOWS UP OR DOWN BSP LAYOUT
#     Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
#     Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
#     Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
#     Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
# 
# # MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
#     Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
#     Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
#     Key([mod, "shift"], "Left", lazy.layout.swap_left()),
#     Key([mod, "shift"], "Right", lazy.layout.swap_right()),
# 
# TOGGLE FLOATING LAYOUT
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

    # CUSTOM KEYS
    Key(["mod4", "shift"], "s", lazy.spawn("shutdown now"), desc="Shutdown system"),
    # Key(["mod4"], "s", lazy.spawn("systemctl suspend"), desc="Suspend system"),
    #Key(["mod4"], "l", lazy.spawn("sleep 0.5 && xset dpms force off"), desc="Lock Screen"),    # not working

]

def window_to_previous_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i - 1)

def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i + 1)

keys.extend([
    # MOVE WINDOW TO NEXT SCREEN
    Key(["mod1", "shift"], "Tab", lazy.function(window_to_previous_screen, switch_screen=True)),
])

groups = []

# FOR QWERTY KEYBOARDS
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0",]

# FOR AZERTY KEYBOARDS
#group_names = ["ampersand", "eacute", "quotedbl", "apostrophe", "parenleft", "section", "egrave", "exclam", "ccedilla", "agrave",]

#group_labels = ["1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ", "9 ", "0",]
group_labels = ["", "", "", "", "", "", "", "", "", "",]
#group_labels = ["Web", "Edit/chat", "Image", "Gimp", "Meld", "Video", "Vb", "Files", "Mail", "Music",]

group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall",]
#group_layouts = ["monadtall", "matrix", "monadtall", "bsp", "monadtall", "matrix", "monadtall", "bsp", "monadtall", "monadtall",]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend([

#CHANGE WORKSPACES
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        #Key(["mod1"], "Tab", lazy.screen.next_group()),
        #Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),
        Key(["mod1"], "bracketright", lazy.screen.next_group()),
        Key(["mod1"], "bracketleft", lazy.screen.prev_group()),

# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON WORKSPACE
        #Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND FOLLOW MOVED WINDOW TO WORKSPACE
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()),
    ])


# ─── THEME ─────────────────────────────────────────────────────────────
# Catppuccin Mocha – swap these values to re-theme everything at once
colors = {
    "crust":    "#11111b",
    "mantle":   "#181825",
    "base":     "#1e1e2e",
    "surface0": "#313244",
    "surface1": "#45475a",
    "overlay0": "#6c7086",
    "subtext":  "#a6adc8",
    "text":     "#cdd6f4",
    "lavender": "#b4befe",
    "blue":     "#89b4fa",
    "sapphire": "#74c7ec",
    "teal":     "#94e2d5",
    "green":    "#a6e3a1",
    "yellow":   "#f9e2af",
    "peach":    "#fab387",
    "red":      "#f38ba8",
    "pink":     "#f5c2e7",
    "mauve":    "#cba6f7",
}

# JetBrainsMono Nerd Font for text and icon glyphs; Noto Sans as text fallback.
# "Symbols Nerd Font" itself is NOT installed (only "... Mono"): naming it made
# fontconfig substitute Nimbus Sans, whose placeholder at U+EFC5 replaced the
# memory icon. So icons use an installed Nerd Font, the "Propo" variant: in
# the plain one icons are drawn up to ~2x wider than their advance width, so
# qtile sizes the widget too narrow and clips them (wifi, volume).
FONT = "JetBrainsMono Nerd Font, Noto Sans, Symbols Nerd Font"
ICON_FONT = "JetBrainsMono Nerd Font Propo"

layout_theme = {
    "margin": 8,  # matches the bar's side margin
    "border_width": 2,
    "border_focus": colors["mauve"],
    "border_normal": colors["surface0"],
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Floating(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Max(**layout_theme),
]


# ─── BAR ───────────────────────────────────────────────────────────────
# qtile-extras gives rounded "pill" backgrounds; without it widgets fall
# back to flat coloured blocks so the config still loads.
try:
    from qtile_extras import widget as xwidget
    from qtile_extras.widget.decorations import RectDecoration
    HAS_EXTRAS = True
except ImportError:
    xwidget = widget
    HAS_EXTRAS = False


class Net(xwidget.Net):
    # Polling widgets re-poll on every click, but Net divides the bytes since
    # the previous poll by update_interval, so an early poll shows a speed
    # far too low (and shortchanges the next one). Run only the click action.
    def button_press(self, x, y, button):
        widget.base._TextBox.button_press(self, x, y, button)


TRANSPARENT = "#00000000"
ISLAND = colors["base"]


def pill(color=ISLAND):
    # group=True merges adjacent decorated widgets into one rounded island;
    # an undecorated widget (e.g. a stretch spacer) ends the island.
    if HAS_EXTRAS:
        return {"decorations": [RectDecoration(colour=color, radius=14, filled=True,
                                               padding_y=0, group=True)]}
    return {"background": color}


def gap(width=8):
    # Spacing *inside* an island (keeps the island background)
    return xwidget.Spacer(length=width, **pill())


def stretch():
    # Transparent space *between* islands
    return xwidget.Spacer(length=bar.STRETCH)


def icon(glyph, color, **kw):
    return xwidget.TextBox(text=glyph, font=ICON_FONT, foreground=color, fontsize=15,
                           padding=4, **pill(), **kw)


def sep():
    return xwidget.TextBox(text="\u2502", foreground=colors["surface1"], padding=4,
                           **pill())


widget_defaults = dict(
    font=FONT,
    fontsize=13,
    padding=6,
    foreground=colors["text"],
    background=TRANSPARENT,
)
extension_defaults = widget_defaults.copy()


def init_widgets_list(systray=True):
    # ── left island: launcher, workspaces, layout
    left = [
        gap(10),
        xwidget.TextBox(
            text="\uf303", font=ICON_FONT, fontsize=18, padding=8, foreground=colors["blue"],
            mouse_callbacks={"Button1": lazy.spawn("rofi -show drun -show-icons")},
            **pill(),
        ),
        xwidget.GroupBox(
            font=ICON_FONT,
            fontsize=15,
            margin_y=3,
            margin_x=2,
            padding_x=8,
            borderwidth=3,
            disable_drag=True,
            highlight_method="line",
            highlight_color=[ISLAND, ISLAND],
            active=colors["text"],
            inactive=colors["overlay0"],
            this_current_screen_border=colors["mauve"],
            this_screen_border=colors["lavender"],
            other_current_screen_border=colors["blue"],
            other_screen_border=colors["surface1"],
            urgent_border=colors["red"],
            urgent_text=colors["red"],
            rounded=True,
            **pill(),
        ),
        sep(),
        xwidget.CurrentLayout(mode="icon", scale=0.55, padding=6, **pill()),
        gap(12),
    ]
    # ── centre island: clock (click → calendar)
    cal = {"Button1": lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/calendar.sh"))}
    centre = [
        gap(14),
        icon("\uf017", colors["mauve"], mouse_callbacks=cal),
        xwidget.Clock(format="%a %d %b", foreground=colors["subtext"],
                      mouse_callbacks=cal, **pill()),
        xwidget.Clock(format="%I:%M %p", font=FONT + " Bold", mouse_callbacks=cal,
                      **pill()),
        gap(14),
    ]
    # ── right island: stats, tray, power (click net → vnstat usage)
    netstats = {"Button1": lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/netstats.sh"))}
    # fmt centres each value in a fixed character count (its longest possible
    # text), so in the monospace FONT the width never changes and the bar
    # (and centred clock) don't shift. Net speeds stay below 1000 per unit
    # (B/kB/MB, factor 1000), so "999kB \u2193\u2191 999kB" is the longest net text.
    right = [
        gap(12),
        icon("\uf4bc", colors["blue"]),
        xwidget.CPU(format="{load_percent:.0f}%", fmt="{:^4}", update_interval=2,
                    **pill()),
        icon("\uefc5", colors["green"]),
        xwidget.Memory(format="{MemUsed:.1f}G", fmt="{:^5}", measure_mem="G",
                       update_interval=2, **pill()),
        icon("\uf1eb", colors["sapphire"], mouse_callbacks=netstats),
        Net(format="{down:.0f}{down_suffix} \uf063\uf062 {up:.0f}{up_suffix}",
            fmt="{:^14}", update_interval=2, mouse_callbacks=netstats, **pill()),
        icon("\uf028", colors["peach"]),
        xwidget.Volume(
            unmute_format="{volume}%",
            mute_format="mute",
            fmt="{:^4}",
            volume_app="pavucontrol",
            mute_command="wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
            volume_up_command="wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+",
            volume_down_command="wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
            get_volume_command="wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf \"%d%%\", $2*100+0.5}'",
            check_mute_command="wpctl get-volume @DEFAULT_AUDIO_SINK@",
            check_mute_string="[MUTED]",
            **pill(),
        ),
    ]
    # Only one systray may exist across all bars
    if systray:
        # StatusNotifier draws icons itself, so they blend into the island;
        # XEmbed Systray shows the wallpaper through icons on a transparent bar.
        # Apps like nm-applet and variety only send an icon *name*; qtile
        # resolves it with pyxdg (python-pyxdg) in icon_theme, else it shows
        # a fallback (nm-applet) or drops the item entirely (variety).
        try:
            import dbus_fast  # noqa: F401
            tray = xwidget.StatusNotifier(icon_size=16, padding=6,
                                          icon_theme="Sardi-Arc", **pill())
            # Left-click calls the item's Activate, which AppIndicator apps
            # (nm-applet --indicator, variety) ignore: they're menu-only. Open
            # their menu on left-click; other apps still get Activate.
            if hasattr(tray, "show_menu"):
                def _tray_left_click(tray=tray):
                    item = tray.selected_item
                    if item and item.menu and (getattr(item, "is_context_menu", False)
                                               or item.path.startswith("/org/ayatana/")):
                        tray.show_menu()
                    else:
                        tray.activate()
                tray.mouse_callbacks["Button1"] = _tray_left_click
        except ImportError:
            tray = xwidget.Systray(icon_size=16, padding=6, background=ISLAND, **pill())
        right += [sep(), tray]
    right += [
        sep(),
        xwidget.TextBox(
            text="\uf011", font=ICON_FONT, fontsize=15, padding=8, foreground=colors["red"],
            mouse_callbacks={"Button1": lazy.spawn(
                os.path.expanduser("~/.config/qtile/scripts/powermenu.sh"))},
            **pill(),
        ),
        gap(10),
    ]
    return left + [stretch()] + centre + [stretch()] + right


def make_bar(systray):
    return bar.Bar(
        widgets=init_widgets_list(systray),
        # Floating bar. The -4 bottom margin makes it reserve 4px less, so the
        # window gap below it is 4px instead of the layout's 8: windows start
        # at 6 + 28 - 4 + 8 = 38px. calendar.sh (posy) and dunstrc (offset)
        # sit at that line; update them together. Note: qtile raises if a
        # dock app reserving screen space (strut) is used with a negative margin.
        size=28,
        margin=[6, 8, -4, 8],
        background=TRANSPARENT,
    )


# On X11, variety (autostart.sh) owns the wallpaper. Its feh call kills the X
# client holding the old root pixmap, i.e. qtile's wallpaper painter, after
# which every reload/screen change dies in Screen.paint() before keys are
# grabbed. So qtile only paints the wallpaper itself on wayland.
def init_screens():
    wallpaper = {} if qtile.core.name == "x11" else dict(
        wallpaper='~/.config/qtile/wall.jpg', wallpaper_mode='fill')
    return [Screen(top=make_bar(systray=True), **wallpaper),
            Screen(top=make_bar(systray=False), **wallpaper)]
screens = init_screens()


# MOUSE CONFIGURATION
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]


# ─── SWIPE WORKSPACES ──────────────────────────────────────────────────
# Hold the second mouse side button (Button9) and move left/right to step
# through workspaces; every SWIPE_STEP px of travel switches one workspace.
SWIPE_BUTTON = "Button9"
SWIPE_STEP = 150
_swipe = {"base": 0}


def _swipe_move(qtile, x, _y):
    delta = x - _swipe["base"]
    if abs(delta) < SWIPE_STEP:
        return
    if delta > 0:
        qtile.current_screen.next_group(skip_empty=False)
    else:
        qtile.current_screen.prev_group(skip_empty=False)
    _swipe["base"] = x


def _swipe_start(qtile):
    # Drag only starts when a window is focused, so begin the drag manually
    # here to make swiping work on empty workspaces too.
    _swipe["base"] = 0
    if qtile._drag is None:
        x, y = qtile.core.get_mouse_position()
        qtile._drag = (x, y, 0, 0, [lazy.function(_swipe_move)])
        qtile.core.grab_pointer()
    return (0, 0)


# Hold the first side button (Button8) and move left/right to carry the
# focused window to the next/previous workspace, following it there.
CARRY_BUTTON = "Button8"
_carry = {"base": 0}


def _carry_move(qtile, x, _y):
    delta = x - _carry["base"]
    win = qtile.current_window
    if abs(delta) < SWIPE_STEP or win is None:
        return
    groups = qtile.groups
    idx = groups.index(qtile.current_group)
    target = groups[(idx + (1 if delta > 0 else -1)) % len(groups)]
    win.togroup(target.name)
    qtile.current_screen.set_group(target)
    win.group.focus(win)
    _carry["base"] = x


def _carry_start(qtile):
    _carry["base"] = 0
    if qtile._drag is None and qtile.current_window is not None:
        x, y = qtile.core.get_mouse_position()
        qtile._drag = (x, y, 0, 0, [lazy.function(_carry_move)])
        qtile.core.grab_pointer()
    return (0, 0)


mouse += [
    Click([], CARRY_BUTTON, lazy.function(_carry_start)),
    Drag([], CARRY_BUTTON, lazy.function(_carry_move),
         start=lazy.function(_carry_start)),
    Click([], SWIPE_BUTTON, lazy.function(_swipe_start)),
    # Registered so qtile ends the drag when the button is released
    Drag([], SWIPE_BUTTON, lazy.function(_swipe_move),
         start=lazy.function(_swipe_start)),
]

dgroups_key_binder = None
dgroups_app_rules = []

# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME
# BEGIN

#########################################################
################ assgin apps to groups ##################
#########################################################
# @hook.subscribe.client_new
# def assign_app_group(client):
#     d = {}
#     #####################################################################################
#     ### Use xprop fo find  the value of WM_CLASS(STRING) -> First field is sufficient ###
#     #####################################################################################
#     d[group_names[0]] = ["Navigator", "Firefox", "Vivaldi-stable", "Vivaldi-snapshot", "Chromium", "Google-chrome", "Brave", "Brave-browser",
#               "navigator", "firefox", "vivaldi-stable", "vivaldi-snapshot", "chromium", "google-chrome", "brave", "brave-browser", ]
#     d[group_names[1]] = [ "Atom", "Subl", "Geany", "Brackets", "Code-oss", "Code", "TelegramDesktop", "Discord",
#                "atom", "subl", "geany", "brackets", "code-oss", "code", "telegramDesktop", "discord", ]
#     d[group_names[2]] = ["Inkscape", "Nomacs", "Ristretto", "Nitrogen", "Feh",
#               "inkscape", "nomacs", "ristretto", "nitrogen", "feh", ]
#     d[group_names[3]] = ["Gimp", "gimp" ]
#     d[group_names[4]] = ["Meld", "meld", "org.gnome.meld" "org.gnome.Meld" ]
#     d[group_names[5]] = ["Vlc","vlc", "Mpv", "mpv" ]
#     d[group_names[6]] = ["VirtualBox Manager", "VirtualBox Machine", "Vmplayer",
#               "virtualbox manager", "virtualbox machine", "vmplayer", ]
#     d[group_names[7]] = ["Thunar", "Nemo", "Caja", "Nautilus", "org.gnome.Nautilus", "Pcmanfm", "Pcmanfm-qt",
#               "thunar", "nemo", "caja", "nautilus", "org.gnome.nautilus", "pcmanfm", "pcmanfm-qt", ]
#     d[group_names[8]] = ["Evolution", "Geary", "Mail", "Thunderbird",
#               "evolution", "geary", "mail", "thunderbird" ]
#     d[group_names[9]] = ["Spotify", "Pragha", "Clementine", "Deadbeef", "Audacious",
#               "spotify", "pragha", "clementine", "deadbeef", "audacious" ]
#     ######################################################################################
#
# wm_class = client.window.get_wm_class()[0]
#
#     for i in range(len(d)):
#         if wm_class in list(d.values())[i]:
#             group = list(d.keys())[i]
#             client.togroup(group)
#             client.group.cmd_toscreen(toggle=False)

# END
# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME



main = None

@hook.subscribe.startup_once
def start_once():
    # autostart.sh is full of X11-only tools (picom, variety, setxkbmap...)
    # that hang or misbehave under the wayland backend
    if qtile.core.name == "x11":
        home = os.path.expanduser('~')
        subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])

@hook.subscribe.startup
def start_always():
    if qtile.core.name == "x11":
        # Set the cursor to something sane in X
        subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

# Switching the monitor's input makes every output look disconnected for a
# moment; qtile 0.37.1 then swaps in a bar-less placeholder Screen and crashes
# with "'Screen' object has no attribute 'group'" when the monitor comes back,
# so the bar never returns. Skip reconfiguring while no output is connected.
reconfigure_screens = False

@hook.subscribe.screen_change
def _screen_change(event):
    if qtile.get_output_info():
        qtile.reconfigure_screens()

@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True

floating_types = ["notification", "toolbar", "splash", "dialog"]


follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules, 
    Match(wm_class='qtile-calendar'),
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='Arcolinux-welcome-app.py'),
    Match(wm_class='Archlinux-tweak-tool.py'),
    Match(wm_class='Arcolinux-calamares-tool.py'),
    Match(wm_class='confirm'),
    Match(wm_class='dialog'),
    Match(wm_class='download'),
    Match(wm_class='error'),
    Match(wm_class='file_progress'),
    Match(wm_class='notification'),
    Match(wm_class='splash'),
    Match(wm_class='toolbar'),
    Match(wm_class='Arandr'),
    Match(wm_class='feh'),
    Match(wm_class='Galculator'),
    Match(wm_class='archlinux-logout'),
    Match(wm_class='xfce4-terminal'),

],  fullscreen_border_width = 0, border_width = 2,
    border_focus = colors["mauve"], border_normal = colors["surface0"])
auto_fullscreen = True

focus_on_window_activation = "focus" # or smart

wmname = "LG3D"
