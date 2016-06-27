
# Bash檢查檔案資料夾是否存在

Bash File Testing

-b filename - Block special file
-c filename - Special character file
-d directoryname - Check for directory existence
-e filename - Check for file existence, regardless of type (node, directory, socket, etc.)
-f filename - Check for regular file existence not a directory
-G filename - Check if file exists and is owned by effective group ID.
-g filename - true if file exists and is set-group-id.
-k filename - Sticky bit
-L filename - Symbolic link
-O filename - True if file exists and is owned by the effective user id.
-r filename - Check if file is a readable
-S filename - Check if file is socket
-s filename - Check if file is nonzero size
-u filename - Check if file set-user-id bit is set
-w filename - Check if file is writable
-x filename - Check if file is executable

```
example_1

#!/bin/bash
file=./file
if [ -e "$file" ]; then
echo "File exists"
else 
echo "File does not exist"
fi

example_2

#!/bin/bash
file=./file
if [ ! -e "$file" ]; then
echo "File does not exist"
else 
echo "File exists"
fi
```