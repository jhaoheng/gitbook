# codeigniter - email

```
<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/* 
| ------------------------------------------------------------------- 
| EMAIL CONFING 
| ------------------------------------------------------------------- 
| Configuration of outgoing mail server. 
| */
$config['protocol']='smtp';
//$config['smtp_host']='ssl://smtp.googlemail.com';  
$config['smtp_host']='ssl://smtp.gmail.com';
$config['smtp_port']='465';
$config['smtp_timeout']='30';
$config['smtp_user']='funwishtaiwan@gmail.com';
$config['smtp_pass']='fun28862730';
$config['charset']='utf-8';
$config['mailtype']='html';
$config['newline']="\r\n";

/* End of file email.php */
/* Location: ./system/application/config/email.php */
?>
```