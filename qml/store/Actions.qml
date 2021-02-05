import QtQuick 2.0
import Felgo 3.0

Item {

    signal fetchPosts()

    signal changePostsListSerachValue(string value)

    signal togglePostListFavourite(var post)

    signal removePostListFromFavourites(int postId)

    signal changeDialogOptions(var options)

}
