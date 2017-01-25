import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1
import com.avocado 1.0

Page {
    tools: commonTools

    orientationLock: PageOrientation.LockPortrait

    Header {
        id: header
        width: parent.width
        anchors.top: parent.top

        title: "SunRiseSet"
    }
    ListView {
        id: listView
        width: parent.width
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        clip: true

        model: sunRiseSetModel

        delegate: Item {
            height: UiConstants.ListItemHeightSmall
            width: parent.width

            function getTime(t)
            {
                //console.log(t);
                if (t == "")
                    return "------";
                else
                    return Qt.formatTime(t, 'hh:mm')
            }

            function getSunRise()
            {
                if (sunRiseSetModel.type == SunRiseSetModel.Civil)
                    return riseCivilTime;
                if (sunRiseSetModel.type == SunRiseSetModel.Nautical)
                    return riseNauticalTime;
                if (sunRiseSetModel.type == SunRiseSetModel.Astronomical)
                    return riseAstronomicalTime;
                return riseTime;
            }
            function getSunSet()
            {
                if (sunRiseSetModel.type == SunRiseSetModel.Civil)
                    return setCivilTime;
                if (sunRiseSetModel.type == SunRiseSetModel.Nautical)
                    return setNauticalTime;
                if (sunRiseSetModel.type == SunRiseSetModel.Astronomical)
                    return setAstronomicalTime;
                return setTime;
            }
            BorderImage {
                id: background
                anchors.fill: parent
                anchors.leftMargin: -16
                anchors.rightMargin: -16
                visible: mouseArea.pressed
                source: theme.inverted ? "image://theme/meegotouch-panel-inverted-background-pressed" : "image://theme/meegotouch-panel-background-pressed"
            }

            HorizontalLine {
                anchors.top: parent.top
            }
            Label {
                anchors {
                    left: parent.left
                    leftMargin: 16
                    verticalCenter: parent.verticalCenter
                }
                platformStyle: LabelStyle {
                    fontPixelSize: 30
                }
                text: Qt.formatDate(date, 'dd-MM-yyyy')
            }

            /*Row {
                height: parent.height
                anchors {
                    right: parent.right
                    rightMargin: 10
                }
                spacing: 10*/
                Image {
                    id: riseIcon
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 260
                    source: "qrc:/images/icon_rise.png"
                }
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: riseIcon.right
                    anchors.leftMargin: 10
                    //height: parent.height
                    text: getTime(getSunRise())
                }
                /*Item {
                    width: 20
                    height: 1
                }*/
                Image {
                    id: setIcon
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 380
                    source: "qrc:/images/icon_set.png"
                }
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: setIcon.right
                    anchors.leftMargin: 10
                    //height: parent.height
                    text: getTime(getSunSet())
                }
                /*Label{
                    anchors.verticalCenter: parent.verticalCenter
                    text: Qt.formatTime(noonTime, 'hh:mm:ss')
                }*/
            /*}*/

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    //console.log(item);
                    //Qt.resolvedUrl
                    appWindow.pageStack.push(Qt.resolvedUrl("DayPage.qml"), {date: date, lengthOfDay: lengthOfDay, noonTime: noonTime,
                                                 riseTime: riseTime, setTime: setTime,
                                                 riseCivilTime: riseCivilTime, setCivilTime: setCivilTime,
                                                 riseNauticalTime: riseNauticalTime, setNauticalTime: setNauticalTime,
                                                 riseAstronomicalTime: riseAstronomicalTime, setAstronomicalTime: setAstronomicalTime});
                }
            }

        }

        onMovementEnded: {
            if(atYBeginning) {
                sunRiseSetModel.addMoreAtBeginning();
            }
            if(atYEnd) {
                sunRiseSetModel.addMoreAtEnd();
            }
        }
    }

    ScrollDecorator {
        flickableItem: listView
    }

    Component.onCompleted: {
        console.log(listView.count);
        console.log(listView.height);
        listView.positionViewAtIndex(5, ListView.End)
    }
}
