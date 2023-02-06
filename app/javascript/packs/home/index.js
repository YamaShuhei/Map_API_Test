let marker = [];
//DOMの #marker-data に緯度経度が渡っているので、取得してmarkerData変数に格納
let markerData = JSON.parse(document.querySelector("#marker-data").dataset.position);

function initMap() {

    //ループを使ってすべての緯度経度を変数に格納
    for (var i = 0; i < markerData.length; i++) {
      markerLatLng = new google.maps.LatLng({
        lat: markerData[i][0],
        lng: markerData[i][1]
      });

      marker[i] = new google.maps.Marker({
        position: markerLatLng,
        map: map
      });
    }
}

window.onload = function() {
  initMap();
};