import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    property string crust: config.crust
    property string mantle: config.mantle
    property string base: config.base
    property string textCol: config.textCol
    property string arrowIco: "arrowDown.svg"
    id: container
    width: 640
    height: 480

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index

    TextConstants { id: textConstants }

    Connections {
        target: sddm

        onLoginSucceeded: {
            errorMessage.color = "steelblue"
            errorMessage.text = textConstants.loginSucceeded
        }

        onLoginFailed: {
            password.text = ""
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
        }
    }

    Rectangle{
        color: base
        anchors.fill: parent
    }

    Image {
        source: config.distroLogo
        property int size: parent.height / 2
        width: size
        height: size
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 20
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        //visible: primaryScreen

        Clock {
            id: clock
            anchors.margins: 20
            anchors.top: parent.top
            anchors.right: parent.right

            color: crust
            timeFont.family: "Oxygen"
        }

        Rectangle {
            id: rectangle
            anchors.centerIn: parent
            width: Math.max(320, mainColumn.implicitWidth + 50)
            height: Math.max(320, mainColumn.implicitHeight + 50)
            color: mantle
            radius: 15 

            Column {
                id: mainColumn
                anchors.centerIn: parent
                spacing: 12
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: textCol
                    verticalAlignment: Text.AlignVCenter
                    height: text.implicitHeight
                    width: parent.width
                    text: textConstants.welcomeText.arg(sddm.hostName)
                    wrapMode: Text.WordWrap
                    font.pixelSize: 24
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                }

                Column {
                    width: parent.width
                    spacing: 4
                    Text {
                        id: lblName
                        width: parent.width
                        text: textConstants.userName
                        font.bold: true
                        font.pixelSize: 12
                        color: textCol
			
                    }

                    TextBox {
                        id: name
                        width: parent.width; height: 30
                        text: userModel.lastUser
                        font.pixelSize: 14
		 	            color: base
                        borderColor: base
                        focusColor: textCol
                        hoverColor: textCol
                        textColor: textCol
                        radius: 5

                        KeyNavigation.backtab: rebootButton; KeyNavigation.tab: password

                        Keys.onPressed: {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, sessionIndex)
                                event.accepted = true
                            }
                        }
                    }
                }

                Column {
                    width: parent.width
                    spacing : 4
                    Text {
                        id: lblPassword
                        width: parent.width
                        text: textConstants.password
                        font.bold: true
                        color: textCol
                        font.pixelSize: 12
                    }

                    PasswordBox {
                        id: password
                        width: parent.width; height: 30
                        font.pixelSize: 14
                        color: base
                        borderColor: base
                        focusColor: textCol
                        hoverColor: textCol
                        textColor: textCol
                        radius: 5
			

                        KeyNavigation.backtab: name; KeyNavigation.tab: session

                        Keys.onPressed: {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, sessionIndex)
                                event.accepted = true
                            }
                        }
                    }
                }

                Row {
                    spacing: 4
                    width: parent.width / 2
                    z: 100

                    Column {
                        z: 100
                        width: parent.width * 1.3
                        spacing : 4
                        anchors.bottom: parent.bottom

                        Text {
                            id: lblSession
                            width: parent.width
                            text: textConstants.session
                            wrapMode: TextEdit.WordWrap
                            font.bold: true
                            font.pixelSize: 12
                            color: textCol
                        }

                        ComboBox {
                            id: session
                            width: parent.width; height: 22
                            font.pixelSize: 12
                            borderColor: base
                            color: base
                            focusColor: textCol
                            hoverColor: textCol
                            arrowIcon: arrowIco
                            //textColor: textCol
                            model: sessionModel
                            index: sessionModel.lastIndex
                            arrowColor: base

                            KeyNavigation.backtab: password; KeyNavigation.tab: layoutBox
                        }
                    }

                    Column {
                        z: 101
                        width: parent.width * 0.7
                        spacing : 4
                        anchors.bottom: parent.bottom

                        Text {
                            id: lblLayout
                            width: parent.width
                            text: textConstants.layout
                            wrapMode: TextEdit.WordWrap
                            font.bold: true
                            font.pixelSize: 12
                            color: textCol
                        }

                        LayoutBox {
                            id: layoutBox
                            width: parent.width; height: 22
                            font.pixelSize: 12
                            color: base
                            borderColor: base
                            focusColor: textCol
                            hoverColor: textCol
                            arrowIcon: arrowIco
                            arrowColor: base
                            KeyNavigation.backtab: session; KeyNavigation.tab: loginButton
                        }
                    }
                }
                Row {
                    spacing: 4
                    anchors.horizontalCenter: parent.horizontalCenter
                    property int btnWidth: Math.max(loginButton.implicitWidth,
                                                    shutdownButton.implicitWidth,
                                                    rebootButton.implicitWidth, 80) + 8
                    Button {
                        id: loginButton
                        text: textConstants.login
                        width: parent.btnWidth
                        color: base
                        borderColor: base
                        textColor: textCol
                        activeColor: base
                        pressedColor: base

                        radius: 5

                        onClicked: sddm.login(name.text, password.text, sessionIndex)

                        KeyNavigation.backtab: layoutBox; KeyNavigation.tab: shutdownButton
                    }

                    Button {
                        id: shutdownButton
                        text: textConstants.shutdown
                        width: parent.btnWidth
                        color: base
                        borderColor: base
                        textColor: textCol
                        activeColor: base
                        pressedColor: base
                        radius: 5

                        onClicked: sddm.powerOff()

                        KeyNavigation.backtab: loginButton; KeyNavigation.tab: rebootButton
                    }

                    Button {
                        id: rebootButton
                        text: textConstants.reboot
                        width: parent.btnWidth
                        color: base
                        borderColor: base
                        textColor: textCol
                        activeColor: base
                        pressedColor: base
                        radius: 5

                        onClicked: sddm.reboot()

                        KeyNavigation.backtab: shutdownButton; KeyNavigation.tab: name
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
    }
}
