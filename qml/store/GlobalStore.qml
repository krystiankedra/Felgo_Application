import QtQuick 2.0
import Felgo 3.0
import "../common"

Item {

    property alias dispatcher: actionsConnection.target

    readonly property bool isLoading: client.loading
    readonly property var postsList: postsListMapper.createPostListModel(_.postsList)
    readonly property string postsListSearchValue: _.postsListSearchValue
    readonly property var dialogOptions: _.dialogOptions

    PostsListMapper {
        id: postsListMapper
    }

    Client {
        id: client
    }

    Connections {
        id: actionsConnection

        onFetchPosts: {
            client.fetchPosts(_.responsePostsListCallback)
            postsListChanged()
        }

        onChangePostsListSerachValue: {
            _.changePostsListSearchValueCallback(value)
            postsListSearchValueChanged()
        }

        onTogglePostListFavourite: {
            _.togglePostListFavouriteCallback(post)
            postsListChanged()
        }

        onRemovePostListFromFavourites: {
            _.removePostListFromFavourites(postId)
            postsListChanged()
        }

        onChangeDialogOptions: {
            _.changeDialogOptionsCallback(options)
            dialogOptionsChanged()
        }


    }

    Item {
        id: _

        property var postsList: []
        property string postsListSearchValue: ""
        property var dialogOptions: ({
            title: "",
            description: "",
            positiveActionLabel: "",
            negativeActionLabel: "",
            onCanceled: null,
            onAccepted: null
        })

        function changePostsListSearchValueCallback(value) {
            postsListSearchValue = value
        }

        function responsePostsListCallback(data) {
            postsList = data.map(function (post) {
                return {
                    userId: post.userId,
                    id: post.id,
                    title: post.title,
                    body: post.body,
                    isFavourite: false,
                    imageUrl: "https://www.w3schools.com/howto/img_forest.jpg"
                }
              })
        }

        function togglePostListFavouriteCallback(post) {
            postsList = postsList.map(function (postObj) {
                if (postObj.id === post.id) {
                    postObj.isFavourite = !postObj.isFavourite
                }
                return postObj
            })
        }

        function removePostListFromFavourites(postId) {
            postsList = postsList.map(function (postObj) {
                if (postObj.id === postId) {
                    postObj.isFavourite = false
                }
                return postObj
            })
        }

        function changeDialogOptionsCallback(options) {
            dialogOptions = {
                title: options.title,
                description: options.description,
                positiveActionLabel: options.positiveActionLabel,
                negativeActionLabel: options.negativeActionLabel,
                onCanceled: options.onCanceled,
                onAccepted: options.onAccepted
            }
        }

    }

}
