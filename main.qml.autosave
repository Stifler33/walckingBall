import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4

Window {
    id: main
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: scene
        anchors.fill: parent
        state: "leftState"
        ComboBox{
            id: effects
            width: 100
            model: ["InQuad", "OutQuad", "InOutQuad", "OutCubic", "OutInCubic", "InOutQuart"]
        }

        Rectangle{
            id: leftRectangle
            width: 100
            height: 100
            x: 100
            y: 200
            color: "lightgrey"
            border.color: "black"
            border.width: 3
            radius: 5
            Text{
                id: textLeft
                anchors.centerIn: parent
                text: "move"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: ball.x += 30//scene.state = "leftState"
            }
        }
        Rectangle{
            id: rightRectangle
            width: 100
            height: 100
            x: 300
            y: 200
            color: "lightgrey"
            border.color: "black"
            border.width: 3
            radius: 5
            Text{
                id: textRight
                anchors.centerIn: parent
                text: "return"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: ball.x += 30//scene.state = "rightState"
            }
        }
        Rectangle{
            id: ball
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            color: "darkgreen"
            radius: width/2
        }
        states: [
            State{
                name: "leftState"
                PropertyChanges{
                    target: ball
                    x: leftRectangle.x + 5
                }
            },
            State{
                name: "rightState"
                PropertyChanges{
                    target: ball
                    x: rightRectangle.x + 5
                }
            }
        ]
        transitions:[
            Transition{
                from: "leftState"
                to : "rightState"
                NumberAnimation{
                    properties: "x,y"
                    duration: 1000
                    easing.type: effects.currentText

                }
            },
            Transition{
                from: "rightState"
                to : "leftState"
                NumberAnimation{
                    properties: "x,y"
                    duration: 1000
                    easing.type: effects.currentText
                }
            }

        ]
    }
}
