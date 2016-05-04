import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Material 0.2

import IssuesController 1.0

ListView {
    id: issues_index

    model: issues.model
    spacing: 10
    maximumFlickVelocity: 600

    anchors.fill: parent
    anchors.bottomMargin: Units.dp(40)

    property var refresh: ( function() { issues.index() } )

    delegate: ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        Component.onCompleted: {
            content_loader.updateHeaderTitle('Issues')
        }
        
        Button {
            anchors.left: parent.left
            anchors.right: parent.right
            elevation: 1

            Text {
                text: subject
                
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10

                wrapMode: Text.WordWrap
            }

            onClicked: {
                content_loader.goto_page(content_loader.issuesShow, id)
            }
        }
    }

    IssuesController {
        id: issues
    }
}