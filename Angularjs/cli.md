# cli

## help

- `ng --help`
- `ng {cmd_1} --help`
- `ng {cmd_1} {cmd_2} --help`

## cmd : new
- 建立一個新的 project : `ng new {project}`

## cmd : generate
> cd {project}

- component
	- 建立一個帶有 html 的 component : `ng generate component {name}`
```
create src/app/hero2/hero2.component.css (0 bytes)
create src/app/hero2/hero2.component.html (24 bytes)
create src/app/hero2/hero2.component.spec.ts (621 bytes)
create src/app/hero2/hero2.component.ts (265 bytes)
update src/app/app.module.ts (468 bytes)
```
	- 建立一個 .html 合併在 .ts 的內容中的 component `ng generate component {name} -it`
```
create src/app/hero/hero.component.css (0 bytes)
create src/app/hero/hero.component.spec.ts (614 bytes)
create src/app/hero/hero.component.ts (275 bytes)
update src/app/app.module.ts (390 bytes)
```