```
func abc(c *gin.Context) {
    header := c.Request.Header
    log.Println(header)
    CTK := c.GetHeader("Orbweb-Ctk")
    log.Println(CTK)
    UTK := c.GetHeader("Orbweb-Utk")
    log.Println(UTK)
}
```