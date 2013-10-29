angular.module('Starbox', []).controller 'FrontCtrl', ["$scope","$http", ($scope,$http)->
  $scope.cupImg = 'empty_cup.png'
  $scope.display = {message:' Welcome to Starbox'}
  $scope.make = (drinkType)->
    $scope.cupImg = 'empty_cup.png'
    $http.get('/starbox/make/'+drinkType).success (data)->
      $scope.display.message = data.message
      $scope.status = data.code
      $scope.pourBeverage()
  $scope.pourBeverage = ->
    if $scope.status == 'ok'
      $scope.cupImg = 'coffee.gif'
    else
      $scope.cupImg = 'empty_cup.png'

]