import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Material 0.2

import IssuesController 1.0

ColumnLayout {
    id: issues_show

    anchors.fill: parent

    property var refresh: (function(id) { issues.show(id) })

    ListView {
        id: issues_show_issue
        model: issues.model
        interactive: false

        anchors.fill: parent

        delegate: Card {
            anchors.left: parent.left
            anchors.right: parent.right
            height: Units.dp(140)
            elevation: 1

            Component.onCompleted: {
                content_loader.updateHeaderTitle(subject)
            }

            Flickable {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 50
                contentHeight: issues_show_card_layout.height

                ColumnLayout {
                    id: issues_show_card_layout
                    // anchors.fill: parent

                    Text {
                        text: subject
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
                        text: "Subject: " + subject
                        font.pointSize: Units.dp(8)
                    }

                    Text {
                        text: "Priority: " + priority
                        font.pointSize: Units.dp(8)
                    }

                    Text {
                        text: "Start date: " + start_date
                        font.pointSize: Units.dp(8)
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
                            text: "Project: "
                            font.pointSize: Units.dp(8)
                        }

                        Button {
                            text: project.name
                            onClicked: {
                                content_loader.goto_page(projectsShow, project.id)
                            }
                        }
                    }
                }
            }
        }
    }

    ListView {
        id: issues_show_time_entries
        model: issues.time_entries

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
                    text: comments + ' ' + user.name + ' ' + hours

                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 10

                    wrapMode: Text.WordWrap
                }

                // onClicked: {
                //     content_loader.goto_page(content_loader.projectsShow, id)
                // }
            }
        }
    }
    IssuesController {
        id: issues
    }
}