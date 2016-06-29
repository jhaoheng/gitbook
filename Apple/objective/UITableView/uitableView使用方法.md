```
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CELL_ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
        cell.backgroundColor = [UIColor clearColor];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    else
    {
    }
    
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    
}
```

## delete

```
mainTable.allowsMultipleSelectionDuringEditing = NO;

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        [itemArray removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}
```