import QtQuick 2.0
import Felgo 3.0
import "HomePage"
import "PostsList"
import "FavouritesPostsList"

Page {

    property var postsList: globalStore.postsList

    property var favouritesPostsList: globalStore.postsList.filter(function (postObj) {
        return postObj.isFavourite
    })

    Navigation {

        navigationMode: navigationModeDrawer

        NavigationItem {
            title: qsTr("Home Page")
            icon: IconType.home

            NavigationStack {
                Page {
                    title: qsTr("Home Page")
                    HomePageWrapper {}
                }
            }
        }

        NavigationItem {
            title: qsTr("Posts List")
            icon: IconType.list

            NavigationStack {
                Page {
                    title: qsTr("Posts List: ") + postsList.length
                    PostsListWrapper {}
                }
            }
        }

        NavigationItem {
            title: qsTr("Favourites Posts List")
            icon: IconType.heart

            NavigationStack {
                Page {
                    title: qsTr("Favourites Posts List: ") + favouritesPostsList.length
                    FavouritesPostsListWrapper {}
                }
            }
        }

    }

}
