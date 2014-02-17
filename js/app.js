angular.module('gee', []).controller('ContactCtrl', function($scope, $http) {
  return $scope.submit_hire = function() {
    var prom;
    this.hf.submitted = true;
    if (this.hf.$valid) {
      $scope.state = 'loading';
      return prom = $http.post('/api/contact', this.data).success(function(resp) {
        $scope.state = 'complete';
        return $scope.resp = resp;
      }).error(function(resp) {
        return $scope.state = 'error';
      });
    }
  };
});
