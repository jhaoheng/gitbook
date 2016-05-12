## 更改 placeholder 的外觀設定

**ios 8**
```
UIColor *color = [UIColor blackColor];    
someUITextField.attributedPlaceholder =
  [[NSAttributedString alloc] initWithString:@"Placeholder Text"
    attributes:@{
       NSForegroundColorAttributeName: color,
       NSFontAttributeName : [UIFont fontWithName:@"Roboto-Bold" size:17.0]
    }
  ];
```

**ios7 以前適用**
```
UIFont *placeholderFont = [UIFont systemFontOfSize:12];
    [R_IdD_field setValue:placeholderFont forKeyPath:@"_placeholderLabel.font"];
```

## feature

- 關閉預設大小寫設定 : `textField.autocapitalizationType = UITextAutocapitalizationTypeNone;`
- 關閉拼寫自動提示 : `textField.autocorrectionType = UITextAutocorrectionTypeNo;`