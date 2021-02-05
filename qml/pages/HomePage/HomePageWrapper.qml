import QtQuick 2.0
import Felgo 3.0
import "../../common"

Page {

    anchors.fill: parent

    Time {
        id: time
    }

    AppText {
        id: welcomeText
        width: parent.width
        anchors.centerIn: parent
        padding: dp(15)
        fontSize: sp(30)
        text: qsTr("Welcome to the application")
    }

    AppText {
        id: additionalWelcomeText
        width: parent.width
        anchors.top: welcomeText.bottom
        padding: dp(15)
        text: qsTr("Go to the post list to view the latest posts and to the favorites tab where you will find your recently added likes.")
    }

    Component.onCompleted: {
       actions.fetchPosts()
    }

}
