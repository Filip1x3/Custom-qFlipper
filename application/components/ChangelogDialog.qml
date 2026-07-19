import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import Theme 1.0
import QFlipper 1.0

CustomDialog {
    id: control

    closable: true
    invertTitle: true
    title: qsTr("Release 1.15 - New Features")

    contentWidget: TextView {
        text: qsTr("Mesh Master / Buddy (ESP-NOW)\n\n    Brand-new mesh feature in the desktop service: the T-Embed acts as master, cheap ESP32 boards as buddies over ESP-NOW.\n    Entry via the lock menu → Mesh Clients (discovery list, pair/remove), client menu with device/WiFi actions and live status.\n    Device identify (start/stop, disconnect) and WiFi handshake capture (channel 1–13, start/stop).\n    Store-and-forward handshake capture: the buddy captures passively, holds EAPOL frames (M1–M4) + beacon per BSSID durably (RAM + NVS), and delivers complete handshakes as an acknowledged unit. The master reassembles them → one .pcap per network (/ext/wifi/buddy_<name>_<ssid>.pcap). Survives master absence and buddy reboots.\n    \"Handshake received\" overlay (3 s) on all mesh views.\n    Buddy firmware now lives in the repo under buddy_firmware/ (standalone, headless ESP-IDF project; features: identify, capture HS; durable HS store).\n\nqFlipper Support\n\n    VID/PID spoofing, CDC bridge, and CLI handshake → qFlipper can connect to the device.\n    Integrated as a background toggle in the lock menu (dedicated FuriThread, RPC-over-CDC).\n\nLock Menu = Central System Toggles\n\n    The desktop lock menu now controls (board-dependent & scrollable): qFlipper, USB storage (full-screen, unmounts SD), Bluetooth (on/off), Switch to Bruce (OTA slot switch + reboot).\n    The former standalone apps usb_storage/ and other_os/ were removed.\n\nNRF24 — Unified Jammer (Rewrite)\n\n    A single shared jammer engine with switchable channel sources (Protocol / Manual / WiFi / Activity scan), strategies (CW/Flood/Turbo), and presets.\n    Persistent per-source configuration.\n    Old separate scenes/views (scene_ch_jammer, scene_smart_jam, scene_wifi_jam, related views) removed and replaced by scene_jam + nrf24_jam_view.\n    Available as a FAP (nRF24_jammer), GPIO fixes.\n\nSubGHz — TPMS Support\n\n    New TPMS decoders: Schrader GG4, Citroen, Ford, Renault, PMV107J (Toyota), plus a generic TPMS decoder.\n    TPMS info view (subghz_view_tpms_info) + edit scene to display/edit sensor data.\n    Extended receiver-info scene and SubGHz history additions.\n\nSubGHz Jammer (Rewrite)\n\n    Switched to continuous async TX (instead of a packet worker), OOK650 noise, up/down frequency selection from the read-mode list.\n\nWLAN — Evil Portal Bridge\n\n    Bridge engine: STA prewarm + NAPT activation (real internet forwarding behind the captive portal).\n    DNS forwarding + cache, iOS captive-portal \"Success\" detection.\n    Bridge UI: toggle + SSID and password input scenes, wired into the portal lifecycle.\n\nAdditional Apps & Targets\n\n    Passy app added (NFC; required API symbols for NFC/mbedtls/bit_buffer added).\n    DIY buttons target: GPIO button input driver incl. README/wiring.\n    Custom color selector (notification/LED settings).\n\nBoard Support\n\n    Waveshare C6 1.47: partial support — display driver fixes (JD9853), touch fixes (AXS5106L), input remapping. (Rated \"not really worth it\" by the author.)\n    Waveshare C6 1.9: SubGHz support enabled, general C6/touch fixes.\n\nBug Fixes & Improvements\n\n    byte_input: rotary encoder mechanism fixed (PR #49, @Ahmadkorhani).\n    IR: long IR signal detection fixed.\n    WLAN: SSID spam fix.\n    Bad USB: various fixes.\n    Deep sleep: fixes.\n    Notification: color/effect reset fixed, notification app header extended.\n    Bluetooth jamming improved.\n    RPC: new property handler (rpc_property.c), storage additions.\n    NFC: MF Classic dict-attack scene adjusted, NTAG/FAL fixes (carried over from v1.1.4).\n    keeloq_mfcodes_user restored from the upstream placeholder.\n    General cleanup: warnings/errors/unused code removed, firmware API table cleaned up and sorted.\n\nMisc\n\n    Latest Bruce")

        textFormat: Text.MarkdownText

        implicitWidth: control.width - 70
        implicitHeight: control.height - 160

        background.visible: false
    }
}
