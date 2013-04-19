root = global ? window

angular.module("characters", ["ngResource"]).factory "Character", ['$resource', ($resource) ->
  Character = $resource("/characters/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Character::destroy = (cb) ->
    Character.remove
      id: @id
    , cb

  Character
]
root.angular = angular
