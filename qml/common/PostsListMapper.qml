import QtQuick 2.0
import Felgo 3.0

Item {

    function createPostListModel(source) {
        return source.map(function(data) {
            return {
                text: data.title,
                detailText: data.body,
                image: data.imageUrl,
                isFavourite: data.isFavourite,
                id: data.id
            }
        })
    }

}
