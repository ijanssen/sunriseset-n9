import com.nokia.meego 1.0
import Qt 4.7
import com.avocado 1.0

Sheet {
    acceptButtonText: qsTr("Save")
    rejectButtonText: qsTr("Cancel")

    content: Column {
        anchors.fill: parent
        ButtonColumn {
            id: buttons
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                id: button1
                property int res: SunRiseSetModel.Offical
                text: qsTr("Sunrise / Sunset")
            }
            Button {
                id: button2
                property int res: SunRiseSetModel.Civil
                text: qsTr("Civil Twilight")
            }
            Button {
                id: button3
                property int res: SunRiseSetModel.Nautical
                text: qsTr("Nautical Twilight")
            }
            Button {
                id: button4
                property int res: SunRiseSetModel.Astronomical
                text: qsTr("Astronomical Twilight")
            }
        }
    }

    onAccepted: {
        sunRiseSetModel.setType(buttons.checkedButton.res);
        console.log(buttons.checkedButton.res);
    }
    Component.onCompleted: {
        if(sunRiseSetModel.type == SunRiseSetModel.Offical)
            button1.checked = true;
        else if(sunRiseSetModel.type == SunRiseSetModel.Civil)
            button2.checked = true;
        else if(sunRiseSetModel.type == SunRiseSetModel.Nautical)
            button3.checked = true;
        else if(sunRiseSetModel.type == SunRiseSetModel.Astronomical)
            button4.checked = true;
    }
}
