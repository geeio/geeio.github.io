angular.module('gee', [])
  .controller 'ContactCtrl', ($scope) ->
    $scope.submit_hire = ->
      @hf.submitted = true
      console.log @data
