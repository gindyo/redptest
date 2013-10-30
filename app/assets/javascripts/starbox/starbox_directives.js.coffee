sb = angular.module('Starbox')
sb.directive 'starboxButton', ->
  restrict: 'A'
  transclude: true
  replace: true
  template: " <div ng-transclude></div>"
  link: (scope, element, atts)->
    element.on "click", ->
      scope.make atts.drinkType
      console.log 'hi'

sb.directive 'imagePaths', ->
  restrict: 'A'
  link: (scope, element, attr)->
    scope.workingImg = attr.workingImg
    scope.emptyImg = attr.emptyImg

sb.directive 'sbStartButton', ->
  restrict: 'A'
  link: (scope, element, attr)->
    element.on "click", ->
      console.log 'starting'
      scope.working = true
      scope.$apply()
      


