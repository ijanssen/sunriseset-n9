import QtQuick 1.0
import com.nokia.meego 1.0

Rectangle {
    id: header
    width: parent.width
    height: 72
    color: 'blue'
    property alias title: titleLabel.text

    Label {
        id: titleLabel
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        font.pixelSize: 32
        color: 'white'
    }
}
