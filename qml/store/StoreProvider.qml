import QtQuick 2.0
import Felgo 3.0
import "../pages"
import "../components"

Item {

    anchors.fill: parent

    Actions {
        id: actions
    }

    GlobalStore {
        id: globalStore
        dispatcher: actions
    }

    Navigation {}

    CustomDialog {
        id: customDialog
    }

}
