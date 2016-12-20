# mail 主體

```
$message = Swift_Message::newInstance()
  			->setSubject($mailSettings['subject'])
  			->setTo($to)
  			->setFrom(array(
  				$mailSettings['fromEmail'] => $mailSettings['fromName']
  			))
  			->setBody($template, 'text/html');
  			if (!$this->_transport) {
				$this->_transport = Swift_SmtpTransport::newInstance(
					$mailSettings['smtp']['server'],
					$mailSettings['smtp']['port'],
					$mailSettings['smtp']['security']
				)
				->setAuthMode('login')
	  			->setUsername($mailSettings['smtp']['username'])
	  			->setPassword($mailSettings['smtp']['password']);
		  	}
		  	// ->setMethod('PATCH');

		  	// Create the Mailer using your created Transport
			$mailer = Swift_Mailer::newInstance($this->_transport);
```

## 注意

- setAuthMode('login') : 關閉二階段驗證，只需驗證 帳號密碼
	- 請使用 ssl : 465 進行連線