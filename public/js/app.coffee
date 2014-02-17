angular.module('gee', [])
  .controller 'ContactCtrl', ($scope, $http) ->
    $scope.submit_hire = ->
      @hf.submitted = true

      if @hf.$valid
        $scope.state = 'loading'
        prom = $http.post('/api/contact', @data)
          .success (resp) ->
            $scope.state = 'complete'
            $scope.resp = resp
          .error (resp) ->
            $scope.state = 'error'

