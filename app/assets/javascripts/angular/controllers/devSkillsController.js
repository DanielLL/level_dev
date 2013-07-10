LevelDevs.controller('devSkillsController', ['$scope', '$http', function($scope, $http){


  $scope.getDevSkills = function(id){
    $http.get('/developers/'+id+'/dev_skills.json').success(function(devSkills){
      $scope.devSkills = devSkills;
    });
  };

  $scope.getAreas = function(id){
    $http.get('/areas.json', { params: { dev_id: id } }).success(function(areas){
      $scope.dev_id     = id;
      $scope.areas = areas;
    });
  };

  $scope.empty_area = function(index){
    if ($scope.areas[index].skills.length == 0){
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
