import QtQuick 2.0
import Felgo 3.0
import "../PostDetails"

Page {

    anchors.fill: parent

    Component {
        id: postDetailsWrapper
        PostDetailsWrapper {}
    }

    function onTextChangedHandler() {
        actions.changePostsListSerachValue(searchBar.text)
    }

    function navigateToDetails(postId) {
        navigationStack.popAllExceptFirstAndPush(postDetailsWrapper, { postId })
    }

    SearchBar {
        id: searchBar
        text: globalStore.postsListSearchValue
        placeHolderText: qsTr("Search by title...")
        onTextChanged: onTextChangedHandler()
    }

    AppListView {
        anchors.top: searchBar.bottom

        model: JsonListModel {
            id: listModel
            keyField: "id"
            source: globalStore.postsListSearchValue.length > 0 ? globalStore.postsList.filter(function (data) {
                return data.text.toLowerCase().includes(globalStore.postsListSearchValue.toLowerCase())
            }) : globalStore.postsList
            fields: ["text", "detailText", "image", "id"]
        }

        emptyText.text: qsTr("No listings available")

        delegate: SimpleRow {
            item: listModel.get(index)
            autoSizeImage: true
            imageMaxSize: dp(90)
            image.fillMode: Image.PreserveAspectCrop
            onSelected: navigateToDetails(item.id)
        }
    }

}

