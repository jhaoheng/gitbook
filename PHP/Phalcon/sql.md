# db 是否刪除的確認

1. 先執行任務
2. 取得 connection 的狀態
3. 判斷是否成功

```
$parameters = array(
    'user_uuid' => 'Basic a2V2aW4ubGluQG9yYndlYi5jb206YTEyMzQ1', 
    'task_uuid' => '5893fc465ba841486093382'
    );

$phql = "DELETE ";
$phql .="FROM Eventtasks ";
$phql .="WHERE user_uuid=:user_uuid: AND task_uuid=:task_uuid:";
$result = $this->modelsManager->executeQuery($phql, $parameters);

$con = $this->di->get('db');

if ($con->affectedRows()) {
    echo $con->affectedRows(), ' were deleted';
}
```



```
    public function selectFrom($phql, $parameters){

        $di = Phalcon\DI::getDefault();
        $db = $di->get('db');
        $result = $db->query($phql, $parameters);
        $result->setFetchMode(Phalcon\Db::FETCH_ASSOC);
        $result = $result->fetchAll($result);

        return $result;
    }
```