```
 class RESTful {
    
     const IS_GET    = "get";
     const IS_POST    = "post";
     const IS_PUT    = "put";
     const IS_DELETE = "delete";
 
     public static function get($key, $default_value = "") {
         return isset($_GET[$key])?$_GET[$key]: $default_value;
     }
    
     public static function post($key, $default_value = "") {
         return isset($_POST[$key])?$_POST[$key]: $default_value;
     }
        
     public static function method() {
         return isset($_SERVER['HTTP_X_HTTP_METHOD_OVERRIDE']) ?$_SERVER['HTTP_X_HTTP_METHOD_OVERRIDE'] : $_SERVER['REQUEST_METHOD'];   
     }
    
     public static function data($key = "", $default_value = "") {
         $method = strtolower(self::method());
         switch($method) {
             case self::IS_GET:
             case self::IS_POST:
                 return self::$method($key, $default_value);
                 break;
             case self::IS_PUT:
             case self::IS_DELETE:
                 return file_get_contents('php://input');
                 break;
         }
     }
    
 }
 
 echo RESTful::method() ."\n";
 
 /*
  * GET : curl -G -d "text=123" "http://localhost/test/php-restful/index.php"
  * POST: curl -d "text=123" "http://localhost/test/php-restful/index.php"
  */
 echo RESTful::data("text")."\n";
 
 /*
  * PUT   : curl -X PUT -d "text=123" http://localhost/test/php-restful/index.php
  * DELETE: curl -X DELETE -d "text=123" http://localhost/test/php-restful/index.php
  */
echo RESTful::data()."\n";
```