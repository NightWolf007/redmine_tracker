import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Material 0.2

import ProjectsController 1.0

ListView {
    id: projects_index

    model: projects.model
    spacing: 10

    Component.onCompleted: projects.index()

    property var header_title: 'Projects'
    property var refresh: (function() { projects.index() })
    property var back: null

    delegate: ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        
        Button {
            text: name
            anchors.left: parent.left
            anchors.right: parent.right
            elevation: 1
        }
    }

    ProjectsController {
        id: projects
    }
}