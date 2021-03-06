(function (){
    var app = angular.module('weather', []);
    app.controller('StoreController',['$scope', '$http', function($scope, $http){
        $scope.get_stations = function () {
            console.log('hi');
            $http.get("/stations").success(function(data){
            $scope.stations = data;        
            $scope.stations = $scope.stations.map(function(station){
                station.is_selected = false;
                return station;
            });
            console.log(data);
        });
        };
        $scope.get_stations();

        $scope.weathers = [];
        $scope.call_weather = function(station){
            console.log(station);
            $('.loading').show();
            station.is_selected =!station.is_selected;
            if(station.is_selected){
                $http.get('/data?lat='+station.lat+'&long='+station.long).success(function(data){
                    $('.loading').hide();
                    console.log(data);
                    $scope.weathers.push(data);
                });
            }
            else{                
               $scope.weathers = _.reject($scope.weathers, function (weather) {
                   $('.loading').hide();
                   return weather.coord.lat == station.lat.toFixed(2) &&weather.coord.lon == station.long.toFixed(2);
               });
            }
        };
    }]);
})();
