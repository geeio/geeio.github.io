angular.module('gee', [])
  .controller 'ContactCtrl', ($scope, $http) ->
    $scope.submit_hire = ->
      @hf.submitted = true
      $http.post '/api/contact', @data
