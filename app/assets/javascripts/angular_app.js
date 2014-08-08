(function (){
    var app = angular.module('store', []);
    app.controller('StoreController', function($scope){
        console.log('cont');
        $scope.name = 'Angular app running';    
    });
})();
