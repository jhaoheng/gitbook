## oneline

`git log --oneline -n 2`

```
919862f add text5
d0de3c6 add text4
```

`git log --name-only --online`
or 
`git log --name-only --online {commit-id}`

## decorate

`git log --decorate -n 2`

```
commit 919862f5ab9b10e5906fda0b07e6b10fefed88ba (HEAD -> b3)
Author: maxhu <jhaoheng@gmail.com>
Date:   Wed Sep 14 23:21:46 2016 +0800

    add text5

commit d0de3c679158809743ca4831ec1767a2a7f6646f (master, b2, b1)
Author: maxhu <jhaoheng@gmail.com>
Date:   Wed Sep 14 22:28:15 2016 +0800

    add text4
```

## graph

`git log --graph -n 2`

```
* commit 919862f5ab9b10e5906fda0b07e6b10fefed88ba
| Author: maxhu <jhaoheng@gmail.com>
| Date:   Wed Sep 14 23:21:46 2016 +0800
| 
|     add text5
|  
* commit d0de3c679158809743ca4831ec1767a2a7f6646f
| Author: maxhu <jhaoheng@gmail.com>
| Date:   Wed Sep 14 22:28:15 2016 +0800
| 
|     add text4
```
