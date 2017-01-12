```php : 
 
<?php  
echo "Test Arguments:\n";
echo "Total : ".$_SERVER["argc"]."\n";

for ($i=0; $i < $_SERVER["argc"]; $i++) { 
    echo "arg_".$i." : ".$_SERVER["argv"][$i]."\n";
}

?>
執行過程 : $ php argu.php a b c d

Test Arguments:
5
argu.php
a
b
c
d
```