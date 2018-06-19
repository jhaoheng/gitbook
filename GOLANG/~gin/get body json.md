```
func abc(c *gin.Context) {
	body := c.Request.Body
    x, _ := ioutil.ReadAll(body)
    // log.Printf("%s \n", string(x))
    data := tools.JSONDecode(x)
    log.Println(data)
    // log.Println(data["action"])
    stream := data["stream"]
    app := data["app"]

    log.Println(app, stream)
}
```
