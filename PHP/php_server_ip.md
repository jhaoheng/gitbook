如果是放在 localhost ， $_server 會沒有這個參數

建議用 isset() 去判斷


```
<?php  

function userIp()
{
    /*
    1. HTTP_CLIENT_IP
    2. HTTP_X_FORWARDED_FOR
    3. HTTP_X_FORWARDED
    4. HTTP_X_CLUSTER_CLIENT_IP
    5. HTTP_FORWARDED_FOR
    6. HTTP_FORWARDED
    7. REMOTE_ADDR
    8. HTTP_VIA
    */
    $HTTP_CLIENT_IP = null;             //1
    $HTTP_X_FORWARDED_FOR = null;       //2
    $HTTP_X_FORWARDED = null;           //3
    $HTTP_X_CLUSTER_CLIENT_IP = null;   //4
    $HTTP_FORWARDED_FOR = null;         //5
    $HTTP_FORWARDED = null;             //6
    $REMOTE_ADDR = null;                //7
    $HTTP_VIA = null;                   //8
    if (isset($_SERVER["HTTP_CLIENT_IP"])) {
        $HTTP_CLIENT_IP = $_SERVER["HTTP_CLIENT_IP"];
    }
    if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) {
        $HTTP_X_FORWARDED_FOR = $_SERVER["HTTP_X_FORWARDED_FOR"];
    }
    if (isset($_SERVER["HTTP_X_FORWARDED"])) {
        $HTTP_X_FORWARDED = $_SERVER["HTTP_X_FORWARDED"];
    }
    if (isset($_SERVER["HTTP_X_CLUSTER_CLIENT_IP"])) {
        $HTTP_X_CLUSTER_CLIENT_IP = $_SERVER["HTTP_X_CLUSTER_CLIENT_IP"];
    }
    if (isset($_SERVER["HTTP_FORWARDED_FOR"])) {
        $HTTP_FORWARDED_FOR = $_SERVER["HTTP_FORWARDED_FOR"];
    }
    if (isset($_SERVER["HTTP_FORWARDED"])) {
        $HTTP_FORWARDED = $_SERVER["HTTP_FORWARDED"];
    }
    if (isset($_SERVER["REMOTE_ADDR"])) {
        $REMOTE_ADDR = $_SERVER["REMOTE_ADDR"];
    }
    if (isset($_SERVER["HTTP_VIA"])) {
        $HTTP_VIA = $_SERVER["HTTP_VIA"];
    }

    $arrayIp = array(
        '1. HTTP_CLIENT_IP' => $HTTP_CLIENT_IP,
        '2. HTTP_X_FORWARDED_FOR' => $HTTP_X_FORWARDED_FOR,
        '3. HTTP_X_FORWARDED' => $HTTP_X_FORWARDED,
        '4. HTTP_X_CLUSTER_CLIENT_IP' => $HTTP_X_CLUSTER_CLIENT_IP,
        '5. HTTP_FORWARDED_FOR' => $HTTP_FORWARDED_FOR,
        '6. HTTP_FORWARDED' => $HTTP_FORWARDED,
        '7. REMOTE_ADDR' => $REMOTE_ADDR,
        '8. HTTP_VIA' => $HTTP_VIA
    );

    echo "USER IP : <br>";
    foreach ($arrayIp as $key => $value) {
        echo $key."=>".$value."<br>";
    }
    echo "<br><br><br>";

    return $arrayIp;
}

userIp();
?>
```