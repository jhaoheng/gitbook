# 修改 help
> -h ; -help

```

	flag.Usage = func() {
		fmt.Fprintf(os.Stderr, "Version %s\n", version)
		fmt.Fprintf(os.Stderr, "Built at %s\n", build)
		fmt.Fprintln(os.Stderr, "usage:")
		flag.PrintDefaults()
	}
	flag.Parse()
```