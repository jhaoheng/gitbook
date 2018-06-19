```
file := "./public/test.ts"

// 执行系统命令
// 第一个参数是命令名称
// 后面参数可以有多个，命令参数
cmd := exec.Command("ffmpeg", "-i", file, "-vf", "scale=640:-1,fps=1", "-f", "singlejpeg", "-vframes", "1", "-ss", "1", "-")
// 获取输出对象，可以从该对象中读取输出结果
log.Println(cmd)
stdout, err := cmd.StdoutPipe()
if err != nil {
log.Fatal(err)
}
// 保证关闭输出流
defer stdout.Close()
// 运行命令
if err := cmd.Start(); err != nil {
log.Fatal(err)
}
// 读取输出结果
opBytes, err := ioutil.ReadAll(stdout)
if err != nil {
log.Fatal(err)
}
log.Println(string(opBytes))

f, err := os.Create("./public/test.png")
defer f.Close()
f.Write(opBytes)
```