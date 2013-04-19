
root = global ? window

CharactersIndexCtrl = ($scope, Character) ->
  $scope.characters = Character.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @character
      @character.destroy ->
        $scope.characters = _.without($scope.characters, original)
        
CharactersIndexCtrl.$inject = ['$scope', 'Character'];

CharactersCreateCtrl = ($scope, $location, Character) ->
  $scope.save = ->
    Character.save $scope.character, (character) ->
      $location.path "/characters/#{character.id}/edit"

CharactersCreateCtrl.$inject = ['$scope', '$location', 'Character'];

CharactersShowCtrl = ($scope, $location, $routeParams, Character) ->
  Character.get
    id: $routeParams.id
  , (character) ->
    @original = character
    $scope.character = new Character(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.character.destroy ->
        $location.path "/characters"

CharactersShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Character'];

CharactersEditCtrl = ($scope, $location, $routeParams, Character) ->
  Character.get
    id: $routeParams.id
  , (character) ->
    @original = character
    $scope.character = new Character(@original)

  $scope.isClean = ->
    console.log "[CharactersEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.character

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.character.destroy ->
        $location.path "/characters"

  $scope.save = ->
    Character.update $scope.character, (character) ->
      $location.path "/characters"

CharactersEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Character'];

# exports
root.CharactersIndexCtrl  = CharactersIndexCtrl
root.CharactersCreateCtrl = CharactersCreateCtrl
root.CharactersShowCtrl   = CharactersShowCtrl
root.CharactersEditCtrl   = CharactersEditCtrl 