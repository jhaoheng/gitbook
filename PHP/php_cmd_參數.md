```php : 
 
<?php
echo "Test Arguments:\n";
echo $_SERVER["argc"]."\n";
echo $_SERVER["argv"][0]."\n";
echo $_SERVER["argv"][1]."\n";
echo $_SERVER["argv"][2]."\n";
echo $_SERVER["argv"][3]."\n";
echo $_SERVER["argv"][4]."\n";
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