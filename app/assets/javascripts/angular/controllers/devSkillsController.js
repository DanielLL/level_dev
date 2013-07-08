LevelDevs.controller('devSkillsController', ['$scope', '$http', function($scope, $http){


  $scope.getDevSkills = function(id){
    $http.get('/developers/'+id+'/dev_skills.json').success(function(devSkills){
      $scope.devSkills = devSkills;
    });
  };

  $scope.getCategories = function(id){
    $http.get('/categories.json', { params: { dev_id: id } }).success(function(categories){
      $scope.dev_id     = id;
      $scope.categories = categories;
    });
  };

  $scope.empty_category = function(index){
    if ($scope.categories[index].skills.length == 0){
      return true;
    }
    else {
      return false;
    }
  }

  $scope.updateDevSkills = function(id){

    var ids_array =[]
    $("input[type='checkbox']:checked").each(function(c){
      ids_array[c] = $(this).parent().attr("id");
    });
    $http.post('/developers/'+id+'/dev_skills', { ids_array: ids_array});
  };


}]);
