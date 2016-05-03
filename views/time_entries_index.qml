import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Material 0.2

import TimeEntriesController 1.0

ListView {
    id: time_entries_index

    model: time_entries.model
    spacing: 10
    maximumFlickVelocity: 600

    anchors.fill: parent
    anchors.bottomMargin: Units.dp(40)

    property var refresh: ( function() { time_entries.index() } )

    delegate: ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        Component.onCompleted: {
            content_loader.updateHeaderTitle('Time Entries')
        }
        
        Button {
            anchors.left: parent.left
            anchors.right: parent.right
            elevation: 1

            Text {
                text: comments + ' ' + user.name + ' ' + hours
                
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10

                wrapMode: Text.WordWrap
            }

            // onClicked: {
            //     content_loader.goto_page(content_loader.projectsShow, id)
            // }
        }
    }

    TimeEntriesController {
        id: time_entries
    }
}