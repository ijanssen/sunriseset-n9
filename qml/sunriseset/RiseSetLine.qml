import QtQuick 1.1
import com.nokia.meego 1.0

Item {
    property alias text: label.text
    property variant riseTime
    property variant setTime

    function getTime(t)
    {
        if (t == "")
            return "------";
        else
            return Qt.formatTime(t, 'hh:mm')
    }

    width: parent.width
    height: 64
    Label {
        id: label
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 24
        font.bold: true
    }

    Image {
        id: riseIcon
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 240
        source: "qrc:/images/icon_rise.png"
    }
    Label {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: riseIcon.right
        anchors.leftMargin: 10
        text: getTime(riseTime)
    }
    Image {
        id: setIcon
        anchors.left: parent.left
        anchors.leftMargin: 360
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/images/icon_set.png"
    }
    Label {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: setIcon.right
        anchors.leftMargin: 10
        text: getTime(setTime)
    }
}
