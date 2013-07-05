LevelDevs.controller('devSkillsController', ['$scope', '$http', function($scope, $http){


  $scope.getDevSkills = function(id){
    $http.get('/developers/'+id+'/dev_skills.json').success(function(devSkills){
      $scope.devSkills = devSkills;
    });
  };


}]);
