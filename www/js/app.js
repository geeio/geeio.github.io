angular.module('gee', []).controller('ContactCtrl', function($scope) {
  return $scope.submit_hire = function() {
    this.hf.submitted = true;
    return console.log(this.data);
  };
});
