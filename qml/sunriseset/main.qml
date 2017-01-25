import QtQuick 1.1
import com.nokia.meego 1.0
import com.avocado 1.0

PageStackWindow {
    id: appWindow

    property variant names: [qsTr("Sunrise / Sunset"), qsTr("Civil "), qsTr("Features")]

    SunRiseSetModel {
        id: sunRiseSetModel
    }

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        Row {
            anchors.right: (parent === undefined) ? undefined : parent.right


            ToolIcon {
                iconId: "toolbar-share"
                onClicked: aboutDialog.open();
            }
            ToolIcon {
                iconId: "toolbar-list"
                //anchors.right: (parent === undefined) ? undefined : parent.right
                onClicked: zenithSettings.open();
            }
            ToolIcon {
                iconId: "toolbar-settings"
                //anchors.right: (parent === undefined) ? undefined : parent.right
                onClicked: locationSheet.open();
            }
        }
    }

    Location {
        id: locationSheet
    }

    ZenithSettings {
        id: zenithSettings
    }

    QueryDialog {
        id: aboutDialog
        titleText : qsTr("About")
        message : qsTr("(c)2012")
        acceptButtonText: qsTr("Ok")
    }
}
