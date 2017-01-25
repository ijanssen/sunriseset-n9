import com.nokia.meego 1.0
import Qt 4.7
import QtMobility.location 1.1
import com.nokia.extras 1.1

Sheet {

    function tzToString(tz)
    {
        var r = Math.abs(tz);
        var h = Math.floor(r);
        var s = "";
        if (tz < 0)
            s = "-";
        else if (tz > 0)
            s = "+";

        if (r > h)
            s += h + ":30";
        else
            s += h + ":00";
        return s;
    }

    acceptButtonText: qsTr("Save")
    rejectButtonText: qsTr("No")

    PositionSource {
        id: positionSource
        //updateInterval: 1000
        active: false
        // nmeaSource: "nmealog.txt"
        onPositionChanged: {
            positionSource.stop();
            latitude.text = positionSource.position.coordinate.latitude;
            longitude.text = positionSource.position.coordinate.longitude;
            updateButton.enabled = true;
        }
    }

    content: Column {
        anchors.fill: parent
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        spacing: 16

        Label {
            text: qsTr("Latitude:")
        }
        /*Row {
            anchors.leftMargin: 50
            TextField {
                width: 100
            }
            Label {
                text: "°"
            }
            TextField {
                width: 100
            }
            Label {
                text: "'"
            }
            TextField {
                width: 100
            }
            Label {
                text: '"'
            }
            Button {
                text: "N"
                width: 100
            }
        }*/
        TextField {
            id: latitude
            anchors{
                leftMargin: 50
                left: parent.left
                right: parent.right
            }
            text: sunRiseSetModel.latitude
            maximumLength: 80
        }
        Label {
            text: qsTr("Longitude:")
        }
        TextField {
            id: longitude
            anchors{
                leftMargin: 50
                left: parent.left
                right: parent.right
            }
            text: sunRiseSetModel.longitude
            maximumLength: 80
        }
        Button {
            id: updateButton
            text: qsTr("Update via  GPS")
            onClicked: {
                positionSource.start();
                updateButton.enabled = false;
            }
            BusyIndicator {
                anchors.left: parent.right
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                running: positionSource.active
                visible: positionSource.active
                platformStyle: BusyIndicatorStyle {
                    size: "small"
                }
            }
        }

        HorizontalLine {
        }

        Label {
            text: qsTr("Time zone:")
        }
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 100
            height: 50
            color: "#2289E0"
            radius: 20
            Label {
                anchors.centerIn: parent
                color: "white"
                text: tzToString(timeZoneSlider.value)
            }
        }

        Slider {
            id: timeZoneSlider
            width: parent.width
            stepSize: 0.5
            valueIndicatorVisible: false
            valueIndicatorText: tzToString(value)
            minimumValue: -12
            maximumValue: 12
            value: sunRiseSetModel.timeZone
        }

        Button {
            text: qsTr("Update to local")
            onClicked: {
                timeZoneSlider.value = sunRiseSetModel.localTimeZone();
                console.log(sunRiseSetModel.localTimeZone());
            }
        }
    }

    onAccepted: {
        sunRiseSetModel.setCoordinates(latitude.text, longitude.text, timeZoneSlider.value);
        sunRiseSetModel.setObj(sunRiseSetModel);
        sunRiseSetModel.setObj(updateButton);
    }
}
