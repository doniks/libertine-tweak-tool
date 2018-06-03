#ifndef LTTPLUGIN_H
#define LTTPLUGIN_H

#include <QQmlExtensionPlugin>

class LTTPlugin : public QQmlExtensionPlugin {
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif
