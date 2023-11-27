# harrix.dev

Example url of articles: `https://harrix.dev/ru/blog/2013/faq-qt`.

The correspondence of the source of the article and the article on the site:

```text
https://github.com/Harrix/harrix.dev-blog-2013/blob/main/faq-qt/faq-qt.md
https://harrix.dev/ru/blog/2013/faq-qt/
```

Collect all changes of articles from submodules:

```console
git submodule foreach git pull origin main
```

Add next year to the site:

```console
git submodule add https://github.com/Harrix/harrix.dev-blog-2023 content/ru/blog/2023
git submodule add https://github.com/Harrix/harrix.dev-blog-2023-en content/en/blog/2023
```
