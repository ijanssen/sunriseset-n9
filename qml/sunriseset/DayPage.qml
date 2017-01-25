import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    property date date
    property variant lengthOfDay: null
    property variant riseTime
    property variant setTime
    property variant riseCivilTime
    property variant setCivilTime
    property variant riseNauticalTime
    property variant setNauticalTime
    property variant riseAstronomicalTime
    property variant setAstronomicalTime
    property variant noonTime


    orientationLock: PageOrientation.LockPortrait

    onLengthOfDayChanged: console.log("length changes " + lengthOfDay);
    Component.onCompleted: console.log("completed");

    tools: ToolBarLayout {
        visible: false
        ToolIcon { platformIconId: "toolbar-back"; onClicked: pageStack.pop(); }
    }

    function getTime(t)
    {
        //console.log(t);
        if (t == "")
            return "------";
        else
            return Qt.formatTime(t, 'hh:mm')
    }

    Header {
        id: header
        width: parent.width
        anchors.top: parent.top

        title: Qt.formatDate(date, 'dd-MM-yyyy')
    }

    Column {
        anchors {
            top: header.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            leftMargin: 16
            rightMargin: 16
        }
        Item {
            width: parent.width
            height: 80
        }
        Item {
            width: parent.width
            height: 40
            Label {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 24
                font.bold: true
                text: qsTr("Sunrise:")
            }
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.verticalCenter: parent.verticalCenter
                text: getTime(riseTime)
            }
        }

        Item {
            width: parent.width
            height: 40
            Label {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 24
                font.bold: true
                text: qsTr("Sunset:")
            }
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.verticalCenter: parent.verticalCenter
                text: getTime(setTime)
            }
        }
        Item {
            width: parent.width
            height: 40
        }

        Item {
            width: parent.width
            height: 40
            Label {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 24
                font.bold: true
                text: qsTr("Noon time:")
            }
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.verticalCenter: parent.verticalCenter
                text: Qt.formatTime(noonTime, 'hh:mm')
            }
        }

        Item {
            width: parent.width
            height: 40
            Label {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 24
                font.bold: true
                text: qsTr("Length on Day:")
            }
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.verticalCenter: parent.verticalCenter
                text: Qt.formatTime(lengthOfDay, 'hh:mm')
            }
        }

        Item {
            width: parent.width
            height: 40
        }


        HorizontalLine {
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 24
            text: qsTr("Twilight")
        }

        RiseSetLine {
            text: qsTr("Civil:")
            riseTime: riseCivilTime
            setTime: setCivilTime
        }

        RiseSetLine {
            text: qsTr("Nautical:")
            riseTime: riseNauticalTime
            setTime: setNauticalTime
        }

        RiseSetLine {
            text: qsTr("Astronomical:")
            riseTime: riseAstronomicalTime
            setTime: setAstronomicalTime
        }
    }
}
