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
        state: "initialState"
        ComboBox{
            id: effects
            width: 100
            Text{
                id: textBox
                text: "effects"
            }

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
                onClicked: if(ball.x >= rightRectangle.x){
                               scene.state = "initialState"
                           }else {
                               scene.state = "otherState"
                               ball.x += 30
                           }
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
                onClicked: scene.state = "initialState"
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
                name: "initialState"
                PropertyChanges{
                    target: ball
                    x: leftRectangle.x + 5
                }
            },
            State{
                name: "otherState"
                PropertyChanges{
                    target: ball
                    x: ball.x
                }
            }
        ]
        transitions:[
            Transition{
                from: "otherState"
                to : "initialState"
                NumberAnimation{
                    properties: "x,y"
                    duration: 700
                    easing.type: effects.currentText

                }
            }

        ]
    }
}
