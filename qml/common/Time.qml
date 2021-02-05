import QtQuick 2.0
import Felgo 3.0

Item {

    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: time.text = qsTr("Date now is: %1.Time now is: %2.").arg(new Date().toLocaleDateString()).arg(new Date().toTimeString())
    }

    AppText {
        id: time
        padding: dp(15)
    }

}
