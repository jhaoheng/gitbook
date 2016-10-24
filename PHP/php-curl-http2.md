brew install php70 --with-homebrew-curl

php -i

```
...
curl

cURL support => enabled
cURL Information => 7.47.1
...
HTTP2 => Yes
...
SSL Version => OpenSSL/1.0.2g
...
```

## push

```
/**
 * @param $http2ch          the curl connection
 * @param $http2_server     the Apple server url
 * @param $apple_cert       the path to the certificate
 * @param $app_bundle_id    the app bundle id
 * @param $message          the payload to send (JSON)
 * @param $token            the token of the device
 * @return mixed            the status code
 */
function sendHTTP2Push($http2ch, $http2_server, $apple_cert, $app_bundle_id, $message, $token) {

    // url (endpoint)
    $url = "{$http2_server}/3/device/{$token}";

    // certificate
    $cert = realpath($apple_cert);

    // headers
    $headers = array(
        "apns-topic: {$app_bundle_id}",
        "User-Agent: My Sender"
    );

    // other curl options
    curl_setopt_array($http2ch, array(
        CURLOPT_URL => $url,
        CURLOPT_PORT => 443,
        CURLOPT_HTTPHEADER => $headers,
        CURLOPT_POST => TRUE,
        CURLOPT_POSTFIELDS => $message,
        CURLOPT_RETURNTRANSFER => TRUE,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSLCERT => $cert,
        CURLOPT_HEADER => 1
    ));

    // go...
    $result = curl_exec($http2ch);
    if ($result === FALSE) {
      throw new Exception("Curl failed: " .  curl_error($http2ch));
    }

    // get response
    $status = curl_getinfo($http2ch, CURLINFO_HTTP_CODE);

    return $status;
}
```

response
```
200 Success
400 Bad request
403 There was an error with the certificate.
405 The request used a bad :method value. Only POST requests are supported.
410 The device token is no longer active for the topic.
413 The notification payload was too large.
429 The server received too many requests for the same device token.
500 Internal server error
503 The server is shutting down and unavailable.
```


## 使用

```
// this is only needed with php prior to 5.5.24
if (!defined('CURL_HTTP_VERSION_2_0')) {
  define('CURL_HTTP_VERSION_2_0', 3);
}
// open connection 
$http2ch = curl_init();
curl_setopt($http2ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_2_0);

// send push
$apple_cert = '/certificates/samplepush/development.pem';
$message = '{"aps":{"alert":"Hi!","sound":"default"}}';
$token = 'dbdaeae86abcde56rtyww1859fb41b2cby053ec48987847';
$http2_server = 'https://api.development.push.apple.com'; // or 'api.push.apple.com' if production
$app_bundle_id = 'it.tabasoft.samplepush';

$status = sendHTTP2Push($http2ch, $http2_server, $apple_cert, $app_bundle_id, $message, $token);
echo "Response from apple -> {$status}\n";

// close connection
curl_close($http2ch);
```


### 多個 token

```
// open connection

// send all the pushes
for ($i = 0; $i < $totSends; $i++) {
   // send push
}

// close connection
```