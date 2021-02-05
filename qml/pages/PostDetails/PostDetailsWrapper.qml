import QtQuick 2.0
import Felgo 3.0

Page {

    title: "Post Details"

    property int postId

    property var post: globalStore.postsList.find(function (postObj) {
        return postObj.id === postId
    })

    function toggleFavourite() {
      actions.togglePostListFavourite(post)
    }


    AppFlickable {
        id: appFlickable
        anchors.fill: parent
        contentHeight: content.height

        Column {
            id: content
            width: parent.width

            AppCard {
                id: card
                width: parent.width
                margin: dp(15)
                paper.radius: dp(5)

                header: SimpleRow {
                    imageSource: post.image
                    detailText: post.text
                    enabled: false
                    image.radius: image.width / 2
                    image.fillMode: Image.PreserveAspectCrop
                    style: {
                        showDisclosure: false
                        backgroundColo: "transparent"
                        contentPaddingAnchorItem: dp(5)
                    }
                }

                media: AppImage {
                    width: parent.width
                    fillMode: Image.PreserveAspectFit
                    source: post.image
                }

                content: AppText {
                    width: parent.width
                    padding: dp(15)
                    text: post.detailText
                }

                actions: Row {
                    IconButton {
                        icon: post.isFavourite ? IconType.heart : IconType.hearto
                        onClicked: toggleFavourite()
                    }
                }

            }
        }
    }

}
