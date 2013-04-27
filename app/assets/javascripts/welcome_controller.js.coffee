root = global ? window

thisApp = root.thisApp

thisApp.controller "WelcomeCtrl", ($scope, Character) ->
  $scope.characters = Character.query()
