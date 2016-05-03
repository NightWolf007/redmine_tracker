import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Material 0.2

import ProjectsController 1.0

ListView {
    id: projects_index

    model: projects.model
    spacing: 10
    maximumFlickVelocity: 500

    property var refresh: (function() { projects.index() })

    delegate: ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        Component.onCompleted: {
            content_loader.updateHeaderTitle('Projects')
        }
        
        Button {
            text: name
            anchors.left: parent.left
            anchors.right: parent.right
            elevation: 1

            onClicked: {
                content_loader.goto_page(content_loader.projectsShow, id)
            }
        }
    }

    ProjectsController {
        id: projects
    }
}