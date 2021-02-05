import QtQuick 2.0
import Felgo 3.0
import "../PostDetails"

Page {

    anchors.fill: parent

    Component {
        id: postDetailsWrapper
        PostDetailsWrapper {}
    }


    function removePostListFromFavourites(postId) {
        customDialog.open()
        actions.changeDialogOptions({
            title: qsTr("Warning"),
            description: qsTr("Do You want to delete post?"),
            positiveActionLabel: qsTr("Delete"),
            negativeActionLabel: qsTr("Cancel"),
            onCanceled: null,
            onAccepted: function() {
                actions.removePostListFromFavourites(postId)
            }
        })
    }

    function navigateToDetails(postId) {
        navigationStack.popAllExceptFirstAndPush(postDetailsWrapper, { postId })
    }

    AppListView {
        model: globalStore.postsList.filter(function (postObj) {
            return postObj.isFavourite
        })

        emptyText.text: qsTr("No favourites available")

        delegate: AppListItem {
            width: parent.width

            text: modelData.text
            detailText: modelData.detailText
            image: modelData.image

            onSelected: navigateToDetails(modelData.id)

            rightItem: AppCheckBox {
              updateChecked: false
              checked: modelData.isFavourite
              anchors.verticalCenter: parent.verticalCenter
              onClicked: removePostListFromFavourites(modelData.id)
            }

        }
    }

}
