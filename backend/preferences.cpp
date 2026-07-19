#include "preferences.h"

#include <QStandardPaths>

#define FIRMWARE_UPDATE_CHANNEL_KEY (QStringLiteral("FirmwareUpdateChannel"))
#define APPLICATION_UPDATE_CHANNEL_KEY (QStringLiteral("ApplicationUpdateChannel"))
#define CHECK_APPLICATION_UPDATES_KEY (QStringLiteral("CheckApplicatonUpdates"))
#define SHOW_HIDDEN_FILES_KEY (QStringLiteral("ShowHiddenFiles"))
#define LAST_FOLDER_URL_KEY (QStringLiteral("LastFolderUrl"))
#define THEME_NAME_KEY (QStringLiteral("ThemeName"))
#define CUSTOM_HUE_KEY (QStringLiteral("CustomHue"))
#define CUSTOM_SATURATION_KEY (QStringLiteral("CustomSaturation"))
#define CUSTOM_BRIGHTNESS_KEY (QStringLiteral("CustomBrightness"))

#define SET_DEFAULT_VALUE(key, value)\
    if(!m_settings.contains(key)) {\
        m_settings.setValue(key, value);\
    }

Preferences::Preferences(QObject *parent):
    QObject(parent)
{
    SET_DEFAULT_VALUE(FIRMWARE_UPDATE_CHANNEL_KEY, QStringLiteral("release"));
    SET_DEFAULT_VALUE(APPLICATION_UPDATE_CHANNEL_KEY, QStringLiteral("release"));
    SET_DEFAULT_VALUE(CHECK_APPLICATION_UPDATES_KEY, false);
    SET_DEFAULT_VALUE(SHOW_HIDDEN_FILES_KEY, false);
    SET_DEFAULT_VALUE(LAST_FOLDER_URL_KEY, QStandardPaths::writableLocation(QStandardPaths::HomeLocation));
    SET_DEFAULT_VALUE(THEME_NAME_KEY, QStringLiteral("amber"));
    SET_DEFAULT_VALUE(CUSTOM_HUE_KEY, 25.0);
    SET_DEFAULT_VALUE(CUSTOM_SATURATION_KEY, 100.0);
    SET_DEFAULT_VALUE(CUSTOM_BRIGHTNESS_KEY, 85.0);
}

Preferences *Preferences::instance()
{
    static auto *prefs = new Preferences();
    return prefs;
}

const QString Preferences::firmwareUpdateChannel() const
{
    return m_settings.value(FIRMWARE_UPDATE_CHANNEL_KEY).toString();
}

void Preferences::setFirmwareUpdateChannel(const QString &newUpdateChannel)
{
    if(newUpdateChannel == firmwareUpdateChannel()) {
        return;
    }

    m_settings.setValue(FIRMWARE_UPDATE_CHANNEL_KEY, newUpdateChannel);
    emit firmwareUpdateChannelChanged();
}

const QString Preferences::applicationUpdateChannel() const
{
    return m_settings.value(APPLICATION_UPDATE_CHANNEL_KEY).toString();
}

void Preferences::setApplicationUpdateChannel(const QString &newUpdateChannel)
{
    if(newUpdateChannel == applicationUpdateChannel()) {
        return;
    }

    m_settings.setValue(APPLICATION_UPDATE_CHANNEL_KEY, newUpdateChannel);
    emit applicationUpdateChannelChanged();
}

bool Preferences::checkApplicationUpdates() const
{
    return false;
}

void Preferences::setCheckApplicationUpdates(bool set)
{
    if(set == checkApplicationUpdates()) {
        return;
    }

    m_settings.setValue(CHECK_APPLICATION_UPDATES_KEY, set);
    emit checkApplicationUpdatesChanged();
}

bool Preferences::showHiddenFiles() const
{
    return m_settings.value(SHOW_HIDDEN_FILES_KEY).toBool();
}

void Preferences::setShowHiddenFiles(bool set)
{
    if(set == showHiddenFiles()) {
        return;
    }

    m_settings.setValue(SHOW_HIDDEN_FILES_KEY, set);
    emit showHiddenFilesChanged();
}

QUrl Preferences::lastFolderUrl() const
{
    return QUrl::fromLocalFile(m_settings.value(LAST_FOLDER_URL_KEY).toString());
}

void Preferences::setLastFolderUrl(const QUrl &url)
{
    if(url == lastFolderUrl()) {
        return;
    }

    m_settings.setValue(LAST_FOLDER_URL_KEY, url.toLocalFile());
    emit lastFolderUrlChanged();
}

const QString Preferences::themeName() const
{
    return m_settings.value(THEME_NAME_KEY).toString();
}

void Preferences::setThemeName(const QString &name)
{
    if(name == themeName()) {
        return;
    }

    m_settings.setValue(THEME_NAME_KEY, name);
    emit themeNameChanged();
}

double Preferences::customHue() const
{
    return m_settings.value(CUSTOM_HUE_KEY).toDouble();
}

void Preferences::setCustomHue(double hue)
{
    if(qFuzzyCompare(hue, customHue())) {
        return;
    }

    m_settings.setValue(CUSTOM_HUE_KEY, hue);
    emit customHueChanged();
}

double Preferences::customSaturation() const
{
    return m_settings.value(CUSTOM_SATURATION_KEY).toDouble();
}

void Preferences::setCustomSaturation(double saturation)
{
    if(qFuzzyCompare(saturation, customSaturation())) {
        return;
    }

    m_settings.setValue(CUSTOM_SATURATION_KEY, saturation);
    emit customSaturationChanged();
}

double Preferences::customBrightness() const
{
    return m_settings.value(CUSTOM_BRIGHTNESS_KEY).toDouble();
}

void Preferences::setCustomBrightness(double brightness)
{
    if(qFuzzyCompare(brightness, customBrightness())) {
        return;
    }

    m_settings.setValue(CUSTOM_BRIGHTNESS_KEY, brightness);
    emit customBrightnessChanged();
}
