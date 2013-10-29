angular.module('Starbox').directive 'starboxButton', ->
  restrict: 'A'
  transclude: true
  replace: true
  template: " <div ng-transclude></div>"
  link: (scope, element, atts)->
    element.on "click", ->
      scope.make atts.drinkType
      console.log 'hi'
