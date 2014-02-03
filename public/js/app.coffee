angular.module('gee', [])
  .controller 'ContactCtrl', ($scope) ->
    $scope.submit_hire = ->
      window.hf = @hf
