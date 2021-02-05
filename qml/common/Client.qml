import QtQuick 2.0
import Felgo 3.0

Item {

    readonly property bool loading: HttpNetworkActivityIndicator.enabled
    readonly property string baseURL: "https://jsonplaceholder.typicode.com/"

    Component.onCompleted: {
        HttpNetworkActivityIndicator.activationDelay = 0
    }

    Item {
        id: _

        function sendRequest(method, entity, callback) {
            HttpRequest[method](baseURL + entity)
            .then(function (res) {
                var content = res.text
                try {
                    var parsedContent = JSON.parse(content)
                    callback(parsedContent)
                } catch (ex) {
                    console.error("Could not parse JSON: ", ex)
                }
            })
            .catch(function (err) {
                console.debug("Fatal error in URL GET", err)
            })
        }
    }

    function fetchPosts(callback) {
        return _.sendRequest('get', 'posts', callback)
    }

}
