# facebook v2.1


# localhost 測試
1. 開發者帳號 
2. facebook developer 建立新的 app
3. 選擇 新增產品 : facebook 登入
4. 在『有效的 OAuth 重新導向 URI』上，填入 `http://localhost`
5. Use Strict Mode for Redirect URIs = OFF

## facebook login javascript

```
<body>

<script>
    window.fbAsyncInit = function() {
        FB.init({
            appId      : '1967567706858345',
            xfbml      : true,
            version    : 'v2.10'
        });

        FB.getLoginStatus(function(response) {
            console.log(response);
            if (response.status === 'connected') {
                console.log('Logged in.');
            }
            else {
                FB.login();
            }
        });
        FB.AppEvents.logPageView();
    };

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

</script>
</body>
```

## example2

```
<!DOCTYPE html>
<html>
<head>
    <title></title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js">></script>
</head>
<body>



<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            testAPI();
        } else {
            // The person is not logged into your app or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
            'into this app.';
            FB.login(function(response) {
                if (response.authResponse) {
                    testAPI();
                } 
                else {
                    console.log('User cancelled login or did not fully authorize.');
                    document.getElementById('status').innerHTML = 'Thanks for logging in';
                }
            }, {scope: 'public_profile, email'});

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

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '1967567706858345',
            cookie     : true,  // enable cookies to allow the server to access 
                                // the session
            xfbml      : true,  // parse social plugins on this page
            version    : 'v2.10' // use graph api version 2.8
        });

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

        FB.getLoginStatus(function(response) {
            console.log(response);
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');

        FB.api('/me', 'get', { fields: 'id,name,gender,email' }, function(response) {

            console.log(response);
            // console.log('Successful login for: ' + response.gender);
            // console.log('Successful login for: ' + response.name);
            // console.log('Successful login for: ' + response.id);
            // console.log('Successful login for: ' + response.email);

            var im = document.getElementById("profileImage").setAttribute("src", "http://graph.facebook.com/" + response.id + "/picture?type=square&width=320&height=320");
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
        });

    }
</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->
<!-- 
<fb:login-button scope="public_profile, email" onlogin="checkLoginState();">
</fb:login-button> -->

<div id="status">
</div>
<img src="" id="profileImage"/>

</body>
</html>
```