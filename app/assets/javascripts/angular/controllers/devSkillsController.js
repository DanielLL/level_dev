LevelDevs.controller('devSkillsController', ['$scope', '$http', function($scope, $http){


  $scope.getDevSkills = function(id){
    $http.get('/developers/'+id+'/dev_skills.json').success(function(devSkills){
      $scope.devSkills = devSkills;
    });
  };

  $scope.getCategories = function(){
    $http.get('/categories.json').success(function(categories){
      $scope.categories = categories;
    });
  };


}]);
