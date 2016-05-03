import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Material 0.2

import UsersController 1.0

ApplicationWindow {
    visible: true
    title: "RedmineTracker"
    width: 800
    height: 600

    RowLayout {
        id: layout
        anchors.fill: parent
        anchors.margins: 10

        Sidebar {
            id: sidebar

            ColumnLayout {
                anchors.fill: parent

                ListView {
                    id: user_view
                    model: users.current

                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: Units.dp(80)
                    interactive: false

                    Component.onCompleted: users.load_current_user()

                    delegate: Card {
                        id: current_user
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: Units.dp(50)
                        elevation: 1

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 10

                            Text {
                                text: firstname + " " + lastname
                                font.pointSize: Units.dp(10)
                            }

                            Text {
                                text: mail
                                font.pointSize: Units.dp(8)
                            }
                        }
                    }
                    UsersController {
                        id: users
                    }
                }

                Button {
                    text: 'Projects'
                    anchors.left: parent.left
                    anchors.right: parent.right

                    onClicked: content_loader.goto_page_force(content_loader.projectsIndex)
                }
                Button {
                    text: 'Issues'
                    anchors.left: parent.left
                    anchors.right: parent.right

                    onClicked: content_loader.goto_page_force(content_loader.issuesIndex)
                }
                Button {
                    text: 'Time Entries'
                    anchors.left: parent.left
                    anchors.right: parent.right
                }
                Button {
                    text: 'Activity'
                    anchors.left: parent.left
                    anchors.right: parent.right
                }
                Button {
                    text: 'Settings'
                    anchors.left: parent.left
                    anchors.right: parent.right
                }
                Button {
                    text: 'Quit'
                    anchors.left: parent.left
                    anchors.right: parent.right
                    onClicked: Qt.quit()
                }
            }
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            
            RowLayout {
                id: header

                property var title: ''

                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                Layout.fillWidth: true
                height: Units.dp(20)

                IconButton {
                    id: back_button
                    iconName: 'navigation/arrow_back'
                    anchors.left: parent.left

                    onClicked: content_loader.goto_prev()
                }

                Text {
                    text: header.title
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                IconButton {
                    iconName: 'navigation/refresh'
                    anchors.right: parent.right

                    onClicked: content_loader.refresh()
                }
            }

            Loader {
                id: content_loader

                anchors.top: header.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin: Units.dp(30)
                Layout.fillWidth: true
                Layout.fillHeight: true

                readonly property var projectsIndex: "projects_index.qml"
                readonly property var projectsShow: "projects_show.qml"
                readonly property var issuesIndex: "issues_index.qml"
                readonly property var issuesShow: "issues_show.qml"

                property var show_id: 0
                property var current_url: projectsIndex
                property var page_stack: []

                source: projectsIndex

                readonly property var refresh: { function() { item.refresh(show_id) } }
                readonly property var updateHeaderTitle: { function(title) { header.title = title } }

                readonly property var load_page: {
                    function(url, id) {
                        current_url = url
                        show_id = id
                        setSource(url)
                    }
                }

                readonly property var goto_page_force: {
                    function(url, id) {
                        page_stack = []
                        load_page(url, id)
                    }
                }

                readonly property var goto_page: {
                    function(url, id) {
                        page_stack.push({ "url" : current_url, "show_id" : show_id })
                        load_page(url, id)
                    }
                }

                readonly property var goto_prev: {
                    function() {
                        var prev = page_stack.pop()
                        if (prev != null) {
                            load_page(prev.url, prev.show_id)
                        }
                    }
                }

                onLoaded: {
                    refresh()
                    back_button.visible = (page_stack.length > 0)
                }
            }
        }
    }
}
