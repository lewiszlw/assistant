import daily_article
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

# 每日看点
app.add_url_rule('/daily-article/hello', view_func=daily_article.hello)
app.add_url_rule('/daily-article/all', view_func=daily_article.all_articles)


if __name__ == '__main__':
    app.run(debug=True, use_reloader=True)