def hello():
    return 'hello world!'

# 拉取所有文章接口
def all_articles():
    return [
        {
            "title": "标题" * 20,
            "abstract": "内容" * 100,
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
            "title": "aaaaaaaaa",
            "abstract": "def",
            "category": "算法",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
            "title": "abcccccccccccc",
            "abstract": "def",
            "category": "前端",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
            "title": "abcdddddddddddd",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
            "title": "abcffffffffffffffff",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
          "title": "标题" * 100,
          "abstract": "abc" * 100,
          "category": "工程",
          "link": "https://github.com",
            "source": "开源中国",
        },
        {
            "title": "Flutter练习（六）—— 多行文字展开收起",
            "abstract": "abc" * 100,
            "category": "算法",
            "link": "https://github.com",
            "source": "开源中国",
        },
        {
            "title": "abcdddddddddddd",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
            "title": "abcffffffffffffffff",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
          "title": "标题" * 100,
          "abstract": "abc" * 100,
          "category": "工程",
          "link": "https://github.com",
            "source": "开源中国",
        },
        {
            "title": "abcdddddddddddd",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
            "title": "abcffffffffffffffff",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
          "title": "标题" * 100,
          "abstract": "abc" * 100,
          "category": "工程",
          "link": "https://github.com",
            "source": "开源中国",
        },
        {
            "title": "abcdddddddddddd",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
            "title": "abcffffffffffffffff",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
          "title": "标题" * 100,
          "abstract": "abc" * 100,
          "category": "工程",
          "link": "https://github.com",
            "source": "开源中国",
        },
        {
            "title": "abcdddddddddddd",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
            "title": "abcffffffffffffffff",
            "abstract": "def",
            "category": "工程",
            "link": "https://www.baidu.com",
            "source": "开源中国",
        },
        {
          "title": "标题" * 100,
          "abstract": "abc" * 100,
          "category": "工程",
          "link": "https://github.com",
            "source": "开源中国",
        },
        {
            "title": "用url_launcher在Flutter中启动URLs",
            "abstract": "URL Launcher是一个Flutter插件，它允许您的应用程序启动网络浏览器、地图应用程序、拨号器应用程序、邮件应用程序等。URL Launcher插件通过创建意图来打开使用不同URL方案的应用程序。在这篇文章中，我们将建立一个简单的项目来演示如何使用URL Launcher插件来打开一个网页浏览器和拨号器、邮件和地图应用程序",
            "category": "移动端",
            "link": "https://github.com",
            "source": "开源中国",
        }
    ]

# TODO 设置文章已读
def read_article():
    pass