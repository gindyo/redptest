angular.module('Starbox', []).controller 'FrontCtrl', ["$scope","$http", ($scope,$http)->
  console.log 'heloo'
  $scope.cupImg = $scope.emptyImg
  $scope.display = {message:' Welcome to Starbox'}
  $scope.make = (drinkType)->
    $scope.cupImg = $scope.emptyImg
    $http.get('/starbox/make/'+drinkType).success (data)->
      $scope.display.message = data.message
      $scope.status = data.code
      $scope.pourBeverage()
  $scope.pourBeverage = ->
    if $scope.status == 'ok'
      $scope.cupImg = $scope.workingImg
    else
      $scope.cupImg = $scope.emptyImg

]