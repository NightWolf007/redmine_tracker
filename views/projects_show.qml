import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Material 0.2

import ProjectsController 1.0

ColumnLayout {
    id: projects_show

    anchors.fill: parent

    property var refresh: (function(id) { projects.show(id) })

    ListView {
        id: projects_show_project
        model: projects.model
        interactive: false

        anchors.fill: parent

        delegate: Card {
            anchors.left: parent.left
            anchors.right: parent.right
            height: Units.dp(140)
            elevation: 1

            Component.onCompleted: {
                content_loader.updateHeaderTitle(name)
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.leftMargin: 10 

                Text {
                    text: name
                    Layout.fillWidth: true
                    font.pointSize: Units.dp(10)
                    wrapMode: Text.WordWrap
                }

                Text {
                    text: description
                    Layout.fillWidth: true
                    font.pointSize: Units.dp(8)
                    wrapMode: Text.WordWrap
                }

                Text {
                    text: "Created at: " + created_on
                    font.pointSize: Units.dp(8)
                }

                Text {
                    text: "Updated at: " + updated_on
                    font.pointSize: Units.dp(8)
                }

                RowLayout {
                    visible: (model.parent != null)

                    Text {
                        text: "Parent project: "
                        font.pointSize: Units.dp(8)
                    }

                    Button {
                        text: model.parent ? model.parent.name : ''
                        onClicked: {
                            content_loader.goto_page(projectsShow, model.parent.id)
                        }
                    }
                }
            }
        }
    }

    ListView {
        id: projects_show_issues
        model: projects.issues

        anchors.fill: parent
        anchors.topMargin: Units.dp(170)
        anchors.bottomMargin: Units.dp(40)
        spacing: 10
        maximumFlickVelocity: 600

        delegate: ColumnLayout {
            anchors.left: parent.left
            anchors.right: parent.right

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
    }
    ProjectsController {
        id: projects
    }
}