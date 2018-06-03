#ifndef MYTYPE_H
#define MYTYPE_H

#include <QObject>

class MyType : public QObject {
    Q_OBJECT

public:
    MyType();
    ~MyType() = default;

    Q_INVOKABLE int doit();
    Q_INVOKABLE QString& container(){ return _container; }
    Q_INVOKABLE int& dpi(){ return _dpi; }
protected:
    QString _container;
    int _dpi;

};

#endif // MYTYPE_H
