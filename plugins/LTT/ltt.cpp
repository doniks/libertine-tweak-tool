#include "ltt.h"
#include <QDebug>
#include <QFile>
#include <QTextStream>
#include <QDir>

LTT::LTT():
    _libertineHome("/home/phablet/.local/share/libertine-container/user-data/"),
    _libertineRoot("")
{

}

void LTT::writeXdefaults(const QString &container, int dpi)
{
    qDebug() << "Apply dpi=" << dpi << "to container:" << container;

    QString filename=libertineHome() + container + "/.Xdefaults";
    QFile file( filename );
    if ( file.open(QIODevice::ReadWrite) )
    {
        QTextStream stream( &file );
        stream << "Xft.dpi:" << dpi << endl;
    }
    else
    {
        qDebug() << "Error: " << filename;
    }
}

void LTT::writeGtkCSS(const QString &container, int scrollBarSize)
{
    qDebug() << "Apply gtk css scrollbar " << scrollBarSize << "to container:" << container;

    QString cdir = libertineHome() + container + "/.config/";
    QString gdir = "gtk-3.0/";
    QDir(cdir).mkdir(gdir);
    QString filename = cdir + gdir + "gtk.css";
    QFile file( filename );
    if ( file.open(QIODevice::ReadWrite) )
    {
        QTextStream stream( &file );
        stream << ".scrollbar {" << endl
               << "    -GtkScrollbar-has-backward-stepper: true; " << endl
               << "    -GtkScrollbar-has-secondary-forward-stepper: true; " << endl
               << "    -GtkRange-slider-width: " << scrollBarSize << "; /* width of the scrollbar */ " << endl
               << "    -GtkRange-stepper-size: " << scrollBarSize << "; /* size of up/down buttons */ " << endl
               << " }" << endl;
    }
    else
    {
        qDebug() << "Error: " << filename;
    }

}

void LTT::read(const QString &filename)
{

    QFile file( filename );
    if ( file.open(QIODevice::ReadOnly) )
    {
        QTextStream stream( &file );

        // while(!in.atEnd()) {
        if ( ! stream.atEnd() )
        {
            QString line = stream.readLine();
            qDebug() << line;
        }
        file.close();

    }
    else
    {
        qDebug() << "read: Error: " << filename;
    }

}

void LTT::wipeHome(const QString& container )
{
    QDir dir( libertineHome() + container );
    if ( dir.removeRecursively() )
    {
        QDir(libertineHome()).mkdir(container);
        qDebug() << "wiped";
    }
    else
    {
        qDebug() << "Error: wipe failed";
    }
}

QStringList LTT::listContainers()
{
    QDir dir( libertineHome() );

    QStringList allFiles = dir.entryList(QDir::NoDotAndDotDot
                                                | QDir::System
                                                | QDir::Hidden
                                                | QDir::AllDirs
                                                | QDir::Files
                                                , QDir::DirsFirst);
    //(QDir::Filter::Files,QDir::SortFlag::NoSort
    qDebug() << allFiles;
    return allFiles;


}
