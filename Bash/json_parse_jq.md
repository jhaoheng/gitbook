
# parse json by jq (on mac)

[source from](http://xmodulo.com/how-to-parse-json-string-via-command-line-on-linux.html)

## install on mac

- mac : `brew install jq`

## install on linux

- linux(32bit) : `wget http://stedolan.github.io/jq/download/linux32/jq`
- linux(64bit) : `wget http://stedolan.github.io/jq/download/linux64/jq`
- `chmod +x ./jq`
- `sudo cp jq /usr/bin`

## example file

```
{
        "name": "Google",
        "location":
                {
                        "street": "1600 Amphitheatre Parkway",
                        "city": "Mountain View",
                        "state": "California",
                        "country": "US"
                },
        "employees":
                [
                        {
                                "name": "Michael",
                                "division": "Engineering"
                        },
                        {
                                "name": "Laura",
                                "division": "HR"
                        },
                        {
                                "name": "Elise",
                                "division": "Marketing"
                        }
                ]
}
```

## use

- To parse a JSON object: `cat json.txt | jq '.name'`
	- output : "Google"
- To parse a nested JSON object: `cat json.txt | jq '.location.city'`
	- output : "Mountain View"
- To parse a JSON array: `cat json.txt | jq '.employees[0].name'`
	- output : "Michael"
- To extract specific fields from a JSON object: `cat json.txt | jq '.location | {street, city}'`
	- output : 
		
		```
		{
		  "city": "Mountain View",
		  "street": "1600 Amphitheatre Parkway"
		}
		```