<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<style>
html,
body {
    height: 100%;
}
html {
    display: table;
    margin: auto;
}
body {
    display: table-cell;
    vertical-align: middle;
    background: #4ECDC4;
}

#login-page {
   width: 500px;
}

.card {
     position: absolute;
     left: 50%;
     top: 50%;
     -moz-transform: translate(-50%, -50%)
     -webkit-transform: translate(-50%, -50%)
     -ms-transform: translate(-50%, -50%)
     -o-transform: translate(-50%, -50%)
     transform: translate(-50%, -50%);
}
</style>
</head>
<body ng-app="mainModule" ng-controller="mainController">
	<div id="login-page" class="row">
		<div class="col s12 z-depth-6 card-panel">
			<form class="login-form" action="/manager/login" method="post">
				<div class="row"></div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">mail_outline</i>
						<input class="validate" id="username" name="username" type="text">
						<label for="username" data-error="wrong" data-success="right">ID</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">lock_outline</i>
						<input id="password" name="password" type="password">
						<label for="password">Password</label>
					</div>
				</div>
				
				<div class="row">
					<div class="input-field col s12">
						<button type="submit" class="btn waves-effect waves-light col s12">Login</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script>
	var app = angular.module('mainModule', []);

	app.controller('mainController', function($scope, $http){ //o scope liga o js e o template
	  $scope.nome = 'Valor Inicial';
	  //$http.get().success();
	  $scope.reset = function()
	  {
	    $scope.nome = '';
	  }
	});
	</script>
</body>




</html>