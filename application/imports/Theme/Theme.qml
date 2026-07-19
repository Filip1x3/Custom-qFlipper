pragma Singleton

import QtQuick 2.15
import QFlipper 1.0

Item {
    id: themeRoot
    visible: false

    readonly property string currentTheme: Preferences.themeName

    // -- Custom theme helper: generate HSL color from HSB user values --
    readonly property double _h: Preferences.customHue / 360.0
    readonly property double _s: Preferences.customSaturation / 100.0
    readonly property double _b: Preferences.customBrightness / 100.0

    // Map Brightness (0-1) to approximate Lightness for hsla()
    readonly property double _lBase: _b < 0.5 ? _b * 0.7 : 0.35 + (_b - 0.5) * 1.0
    readonly property double _lLight: Math.min(_lBase + 0.3, 0.92)
    readonly property double _lMid: _lBase
    readonly property double _lDark: Math.max(_lBase - 0.25, 0.04)

    function _c(l, sMul) {
        return Qt.hsla(_h, Math.min(_s * sMul, 1.0), l, 1.0);
    }

    // -- Preset theme helpers (yellow, green, aqua, pink) --
    readonly property var _themeData: ({
        "yellow": Qt.vector4d(0.12, 0.85, 0.60, 1.0),
        "green":  Qt.vector4d(0.33, 0.70, 0.55, 1.0),
        "aqua":   Qt.vector4d(0.50, 0.65, 0.55, 1.0),
        "pink":   Qt.vector4d(0.92, 0.75, 0.60, 1.0)
    })

    function _t(l) {
        var d = _themeData[currentTheme];
        if (d === undefined) return "black";
        return Qt.hsla(d.x, d.y, l, 1.0);
    }

    // Flattened color properties — direct on root for proper Qt 5.15 binding tracking
    readonly property color transparent: Qt.rgba(0, 0, 0, 0)

    readonly property color lightorange1: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#ffffff";
            case "purple":  return "#d8b4fe";
            case "red":     return "#ef4444";
            case "blue":    return "#93c5fd";
            case "custom":  return _c(_lLight, 1.0);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.57);
            default:        return "#ff9722"; // orange
        }
    }
    readonly property color lightorange2: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#e0e0e0";
            case "purple":  return "#c084fc";
            case "red":     return "#dc2626";
            case "blue":    return "#60a5fa";
            case "custom":  return _c(_lLight * 0.85, 1.0);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.58);
            default:        return "#fe8a2c";
        }
    }
    readonly property color lightorange3: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#b0b0b0";
            case "purple":  return "#a855f7";
            case "red":     return "#b91c1c";
            case "blue":    return "#3b82f6";
            case "custom":  return _c(_lLight * 0.7, 1.0);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.40);
            default:        return "#ce5300";
        }
    }

    readonly property color darkorange1: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#1a1a1a";
            case "purple":  return "#2e1065";
            case "red":     return "#450a0a";
            case "blue":    return "#172554";
            case "custom":  return _c(_lDark, 1.2);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.08);
            default:        return "#491d00";
        }
    }
    readonly property color darkorange2: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#2a2a2a";
            case "purple":  return "#3b0764";
            case "red":     return "#2a0505";
            case "blue":    return "#0f172a";
            case "custom":  return _c(_lDark * 0.8, 1.0);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.10);
            default:        return "#3a1f10";
        }
    }

    readonly property color mediumorange1: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#606060";
            case "purple":  return "#7c3aed";
            case "red":     return "#991b1b";
            case "blue":    return "#1e40af";
            case "custom":  return _c(_lMid, 0.9);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.38);
            default:        return "#9e5823";
        }
    }
    readonly property color mediumorange2: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#4a4a4a";
            case "purple":  return "#6d28d9";
            case "red":     return "#7f1d1d";
            case "blue":    return "#1d4ed8";
            case "custom":  return _c(_lMid * 0.85, 0.85);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.26);
            default:        return "#76380b";
        }
    }
    readonly property color mediumorange3: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#3a3a3a";
            case "purple":  return "#5b21b6";
            case "red":     return "#5c1010";
            case "blue":    return "#1e3a8a";
            case "custom":  return _c(_lMid * 0.7, 0.8);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.20);
            default:        return "#662c00";
        }
    }
    readonly property color mediumorange4: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#555555";
            case "purple":  return "#8b5cf6";
            case "red":     return "#991b1b";
            case "blue":    return "#2563eb";
            case "custom":  return _c(_lMid * 0.9, 0.95);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.33);
            default:        return "#9b450b";
        }
    }
    readonly property color mediumorange5: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#505050";
            case "purple":  return "#9333ea";
            case "red":     return "#991b1b";
            case "blue":    return "#3b82f6";
            case "custom":  return _c(_lMid * 0.88, 0.9);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.34);
            default:        return "#9e4a12";
        }
    }

    readonly property color gridColor: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#505050";
            case "purple":  return "#7c3aed";
            case "red":     return "#991b1b";
            case "blue":    return "#2563eb";
            case "custom":  return _c(_lMid, 0.85);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.37);
            default:        return "#aa5115";
        }
    }
    readonly property color gridBackgroundFrom: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#000000";
            case "purple":  return "#1a0533";
            case "red":     return "#0a0202";
            case "blue":    return "#0a0f1a";
            case "custom":  return Qt.hsla(_h, Math.min(_s * 0.8, 1.0), 0.02, 1.0);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.015);
            default:        return "#090400";
        }
    }
    readonly property color gridBackgroundTo: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#1a1a1a";
            case "purple":  return "#2e1065";
            case "red":     return "#1a0505";
            case "blue":    return "#172554";
            case "custom":  return _c(_lDark * 0.5, 0.8);
            case "yellow":
            case "green":
            case "aqua":
            case "pink":    return _t(0.06);
            default:        return "#210F00";
        }
    }

    readonly property color lightgreen: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#4ade80";
            case "purple":  return "#4ade80";
            case "red":     return "#2ed832";
            case "blue":    return "#4ade80";
            case "custom":  return Qt.hsla(0.33, 0.7, _lLight * 0.85, 1.0);
            default:        return "#2ed832";
        }
    }
    readonly property color mediumgreen1: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#166534";
            case "purple":  return "#166534";
            case "red":     return "#285b12";
            case "blue":    return "#166534";
            case "custom":  return Qt.hsla(0.33, 0.6, _lMid * 0.7, 1.0);
            default:        return "#285b12";
        }
    }
    readonly property color mediumgreen2: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#14532d";
            case "purple":  return "#14532d";
            case "red":     return "#203812";
            case "blue":    return "#14532d";
            case "custom":  return Qt.hsla(0.33, 0.5, _lMid * 0.5, 1.0);
            default:        return "#203812";
        }
    }
    readonly property color darkgreen: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#0a1a0a";
            case "purple":  return "#0a1a0a";
            case "red":     return "#0c160c";
            case "blue":    return "#0a1a0a";
            case "custom":  return Qt.hsla(0.33, 0.5, _lDark * 0.5, 1.0);
            default:        return "#0c160c";
        }
    }

    readonly property color lightblue: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#93c5fd";
            case "purple":  return "#93c5fd";
            case "red":     return "#228cff";
            case "blue":    return "#93c5fd";
            case "custom":  return Qt.hsla(0.58, 0.7, _lLight * 0.85, 1.0);
            default:        return "#228cff";
        }
    }
    readonly property color mediumblue: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#1e3a5f";
            case "purple":  return "#1e3a5f";
            case "red":     return "#143c66";
            case "blue":    return "#1e3a5f";
            case "custom":  return Qt.hsla(0.58, 0.6, _lMid * 0.6, 1.0);
            default:        return "#143c66";
        }
    }
    readonly property color darkblue1: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#0f1d33";
            case "purple":  return "#0f1d33";
            case "red":     return "#11355c";
            case "blue":    return "#0f1d33";
            case "custom":  return Qt.hsla(0.58, 0.6, _lDark * 0.7, 1.0);
            default:        return "#11355c";
        }
    }
    readonly property color darkblue2: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#0a1525";
            case "purple":  return "#0a1525";
            case "red":     return "#152b47";
            case "blue":    return "#0a1525";
            case "custom":  return Qt.hsla(0.58, 0.5, _lDark * 0.5, 1.0);
            default:        return "#152b47";
        }
    }

    readonly property color lightred1: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#ff5b27";
            case "purple":  return "#f87171";
            case "red":     return "#ef4444";
            case "blue":    return "#f87171";
            case "custom":  return Qt.hsla(0.03, 0.85, _lLight * 0.9, 1.0);
            default:        return "#ff5b27";
        }
    }
    readonly property color lightred2: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#ff5924";
            case "purple":  return "#ef4444";
            case "red":     return "#dc2626";
            case "blue":    return "#ef4444";
            case "custom":  return Qt.hsla(0.03, 0.85, _lLight * 0.8, 1.0);
            default:        return "#ff5924";
        }
    }
    readonly property color lightred3: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#ff1f00";
            case "purple":  return "#dc2626";
            case "red":     return "#ff1f00";
            case "blue":    return "#dc2626";
            case "custom":  return Qt.hsla(0.02, 1.0, _lLight * 0.75, 1.0);
            default:        return "#ff1f00";
        }
    }
    readonly property color lightred4: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#ff3c00";
            case "purple":  return "#f87171";
            case "red":     return "#ef4444";
            case "blue":    return "#f87171";
            case "custom":  return Qt.hsla(0.025, 1.0, _lLight * 0.78, 1.0);
            default:        return "#ff3c00";
        }
    }
    readonly property color mediumred1: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#7f1d1d";
            case "purple":  return "#7f1d1d";
            case "red":     return "#7f1d1d";
            case "blue":    return "#7f1d1d";
            case "custom":  return Qt.hsla(0.02, 0.7, _lMid * 0.6, 1.0);
            default:        return "#953618";
        }
    }
    readonly property color mediumred2: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#5c1515";
            case "purple":  return "#5c1515";
            case "red":     return "#5c1010";
            case "blue":    return "#5c1515";
            case "custom":  return Qt.hsla(0.02, 0.6, _lMid * 0.4, 1.0);
            default:        return "#672715";
        }
    }
    readonly property color darkred1: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#2a0a0a";
            case "purple":  return "#2a0a0a";
            case "red":     return "#2a0505";
            case "blue":    return "#2a0a0a";
            case "custom":  return Qt.hsla(0.02, 0.5, _lDark * 0.6, 1.0);
            default:        return "#451a0e";
        }
    }
    readonly property color darkred2: {
        switch(themeRoot.currentTheme) {
            case "white":   return "#1a0505";
            case "purple":  return "#1a0505";
            case "red":     return "#1a0303";
            case "blue":    return "#1a0505";
            case "custom":  return Qt.hsla(0.02, 0.4, _lDark * 0.4, 1.0);
            default:        return "#331400";
        }
    }

    readonly property var timing: QtObject {
        readonly property int toolTipDelay: 500
    }
}
