#include <QDebug>
#include "mytype.h"

MyType::MyType():
    _dpi(12),
    _container("vivid")
{

}

int MyType::doit()
{
    qDebug() << "doit";
    return 666;
}
