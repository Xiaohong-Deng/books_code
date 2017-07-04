pelican + disqus

+ 注意想好pelicanconf.py里DISQUS_SITENAME
+ disqus网站上, 是按照[disqus_static插件](https://github.com/getpelican/pelican-plugins/tree/master/disqus_static)的要求去注册一个application, 很多乱七八糟的要填, 能填DISQUS_SITENAME的尽量填, 以防万一.
+ 另外要将DISQUS安装到自己的站点, 这个注册过程入口不明, 但一开始的页面会问你, 想作为用户发布评论, 还是作为站长使用DISQUS功能, 选后者, 尽量填写DISQUS_SITENAME
+ 在我尝试的2个theme上 clean-blog在index可以显示comment的链接, 但是进入article, disqus无法load, 没有提示; Flex自己集成了disqus插件, 无法加载时会提示, 根据disqus的help, 是上述第二个注册应用里, advanced设置, 设置站点一级域名; 不能设置localhost, 所以本地就无法测试了. 至于clean-blog, 可能是因为disqus插件没有成功加载.
+ 通过删除PLUGINS和PLUGIN_PATHS, 发现是插件没有加载
+ 之后使用相对目录指名plugin_paths, 成功
+ SITEURL似乎也是必要的