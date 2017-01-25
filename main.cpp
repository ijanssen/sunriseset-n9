#include <QApplication>
#include <QDeclarativeContext>
#include <QtDeclarative>

#include "qmlapplicationviewer.h"

#include "sunrisesetmodel.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    qmlRegisterType<SunRiseSetModel>("com.avocado", 1, 0, "SunRiseSetModel");

    QScopedPointer<QmlApplicationViewer> viewer(QmlApplicationViewer::create());

    viewer->setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer->setSource(QUrl("qrc:/main.qml"));
    //viewer->setMainQmlFile(QUrl("qrc:/main.qml"));
    viewer->showExpanded();

    return app->exec();
}
