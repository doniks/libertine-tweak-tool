#ifndef LTT_H
#define LTT_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class LTT: public QObject {
    Q_OBJECT

public:
    LTT();
    ~LTT() = default;

    Q_INVOKABLE void writeXdefaults( const QString & container, int dpi);

    Q_INVOKABLE void writeGtkCSS( const QString & container, int scrollBarSize);

    Q_INVOKABLE void wipeHome(const QString& container );

    Q_INVOKABLE QString libertineRoot(){
        return _libertineRoot;
    }
    Q_INVOKABLE QString libertineHome(){
        return _libertineHome;
    }

    Q_INVOKABLE QStringList listContainers();

protected:
    template<typename T>
    void write(const QString &filename, const T& x){
        qDebug() << "write: " << filename << x ;
        QFile file( filename );
        if ( file.open(QIODevice::ReadWrite) )
        {
            QTextStream stream( &file );
            stream << x << endl;
        }
        else
        {
            qDebug() << "write: Error: "  << filename;
        }

    }

    void read(const QString& filename);


private:
    QString _libertineRoot;
    QString _libertineHome;

};

#endif // LTT_H
