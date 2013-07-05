LevelDevs.controller('skillDevsController', ['$scope', '$http', function($scope, $http){


  $scope.getSkillDevs = function(id){
    $http.get('/developers/'+id+'/skill_devs.json').success(function(skillDevs){
      $scope.skillDevs = skillDevs;
    });
  };


}]);
