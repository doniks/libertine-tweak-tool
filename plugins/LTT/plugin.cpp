#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "ltt.h"
#include "mytype.h"

void LTTPlugin::registerTypes(const char *uri) {
    //@uri LTT
    qmlRegisterSingletonType<LTT>(uri, 1, 0, "LTT", [](QQmlEngine*, QJSEngine*) -> QObject* { return new LTT; });
    qmlRegisterType<MyType>(uri, 1, 0, "MyType");
}
