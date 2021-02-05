import QtQuick 2.0
import Felgo 3.0

Dialog {
    property var dialogOptions: globalStore.dialogOptions

    id: customDialog
    anchors.centerIn: parent
    outsideTouchable: false
    title: dialogOptions.title
    positiveActionLabel: dialogOptions.positiveActionLabel
    negativeActionLabel: dialogOptions.negativeActionLabel
    onCanceled: {
        close()
    }
    onAccepted: {
        dialogOptions.onAccepted()
        close()
    }

    AppText {
        text: dialogOptions.description
        width: parent.width
        anchors.centerIn: parent
        padding: dp(20)
    }

}
