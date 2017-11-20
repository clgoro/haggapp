$(function(){
	$('#fb-token').click(function(event){
		event.preventDefault();
		var token = FB.getAccessToken();
		if (token){
			window.location = $(event.target).attr('href')+ '?token=' + token;
		}else {
			alert("Please login to Facebook first.");
		}
	})
	$('#login-link').click(function(event){
		event.preventDefault();
		FB.login(function(response){
			var ar = response.authResponse;
			if (ar) {
				window.location = $(event.target).attr('href')+ '?token=' + ar.accessToken;
			}
		}, {scope: 'public_profile, email, user_friends'});
		// var token = FB.getAccessToken();
		// if (token){
		// 	window.location = $(event.target).attr('href')+ '?token=' + token;
		// }else {
		// 	alert("Please login to Facebook first.");
		// }
	})
});
window.fbAsyncInit = function() {
	FB.init({
	  appId      : '1279020578871311',
	  cookie     : true,  // enable cookies to allow the server to access
	                      // the session
	  xfbml      : true,  // parse social plugins on this page
	  version    : 'v2.8' // use graph api version 2.8
	});

	checkLoginState();

	// Now that we've initialized the JavaScript SDK, we call
	// FB.getLoginStatus().  This function gets the state of the
	// person visiting this page and can return one of three states to
	// the callback you provide.  They can be:
	//
	// 1. Logged into your app ('connected')
	// 2. Logged into Facebook, but not your app ('not_authorized')
	// 3. Not logged into Facebook and can't tell if they are logged into
	//    your app or not.
	//
	// These three cases are handled in the callback function.
	// FB.getLoginStatus(function(response) {
	//   statusChangeCallback(response);
	// });
};

// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11&appId=1279020578871311';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
// function testAPI() {
//   FB.api('/me', function(response) {
//     document.getElementById('greeting').innerHTML = response.email;
//   });

// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
    console.log("Fbconnected")
    testAPI();

  } else {
    // The person is not logged into your app or we are unable to tell.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into this app.';
  }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}


function testAPI() {
	console.log('Welcome!  Fetching your information.... ');
	FB.api('/me', {fields: 'id,name,age_range,email,picture,gender'}, function(response) {
		console.log('api response', response);
		console.log('Successful login for: ' + response.name);
		// var get_url = document.getElementById('fb-token').href;
		// document.getElementById('fb-token').setAttribute('href', get_url+'?fb_token='+FB.getAccessToken());
		console.log(response.picture.data.url);
		document.getElementById('status').innerHTML =
		'Thanks for logging in, <img src="' + response.picture.data.url +'" width="22"/> ' + response.name + '!';
	});
}


