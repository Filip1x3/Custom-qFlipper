#pragma once

#include <QUrl>
#include <QObject>
#include <QSettings>

class Preferences : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString updateChannel READ firmwareUpdateChannel WRITE setFirmwareUpdateChannel NOTIFY firmwareUpdateChannelChanged)
    Q_PROPERTY(QString appUpdateChannel READ applicationUpdateChannel WRITE setApplicationUpdateChannel NOTIFY applicationUpdateChannelChanged)
    Q_PROPERTY(bool checkAppUpdates READ checkApplicationUpdates WRITE setCheckApplicationUpdates NOTIFY checkApplicationUpdatesChanged)
    Q_PROPERTY(bool showHiddenFiles READ showHiddenFiles WRITE setShowHiddenFiles NOTIFY showHiddenFilesChanged)
    Q_PROPERTY(QString themeName READ themeName WRITE setThemeName NOTIFY themeNameChanged)
    Q_PROPERTY(double customHue READ customHue WRITE setCustomHue NOTIFY customHueChanged)
    Q_PROPERTY(double customSaturation READ customSaturation WRITE setCustomSaturation NOTIFY customSaturationChanged)
    Q_PROPERTY(double customBrightness READ customBrightness WRITE setCustomBrightness NOTIFY customBrightnessChanged)

    Preferences(QObject *parent = nullptr);

public:
    static Preferences *instance();

    const QString firmwareUpdateChannel() const;
    void setFirmwareUpdateChannel(const QString &newUpdateChannel);

    const QString applicationUpdateChannel() const;
    void setApplicationUpdateChannel(const QString &newUpdateChannel);

    bool checkApplicationUpdates() const;
    void setCheckApplicationUpdates(bool set);

    bool showHiddenFiles() const;
    void setShowHiddenFiles(bool set);

    QUrl lastFolderUrl() const;
    void setLastFolderUrl(const QUrl &url);

    const QString themeName() const;
    void setThemeName(const QString &name);

    double customHue() const;
    void setCustomHue(double hue);

    double customSaturation() const;
    void setCustomSaturation(double saturation);

    double customBrightness() const;
    void setCustomBrightness(double brightness);

signals:
    void firmwareUpdateChannelChanged();
    void applicationUpdateChannelChanged();
    void checkApplicationUpdatesChanged();
    void showHiddenFilesChanged();
    void lastFolderUrlChanged();
    void themeNameChanged();
    void customHueChanged();
    void customSaturationChanged();
    void customBrightnessChanged();

private:
    QSettings m_settings;
};

#define globalPrefs (Preferences::instance())

