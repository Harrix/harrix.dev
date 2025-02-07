# harrix.dev

## CLI commands

Collect all changes of articles from submodules:

```shell
git submodule foreach git pull origin main
```

Add next year to the site as a submodule:

```shell
git submodule add https://github.com/Harrix/harrix.dev-articles-2025 content/ru/articles/2025
git submodule add https://github.com/Harrix/harrix.dev-articles-2025-en content/en/articles/2025
```

Beatify:

```shell
prettier --parser markdown --write **/*.md --end-of-line crlf
```

For the last command, you need to install the global package node.js: `npm i -g prettier`.

## Details

Example url of articles: `https://harrix.dev/ru/articles/2013/faq-qt`.

The correspondence of the source of the article and the article on the site:

```text
https://github.com/Harrix/harrix.dev-articles-2016-en/blob/main/pvs-studio/pvs-studio.md
https://harrix.dev/en/articles/2016/pvs-studio/

https://github.com/Harrix/harrix.dev-articles-2013/blob/main/faq-qt/faq-qt.md
https://harrix.dev/ru/articles/2013/faq-qt/

https://github.com/Harrix/harrix.dev-games/blob/main/add-symbol/add-symbol.md
https://harrix.dev/ru/games/add-symbol/
```

Links to markdown for internal articles:

```markdown
[Title](Link to GitHub)<!-- Link to harrix.dev -->

[Review of PVS-Studio](https://github.com/Harrix/harrix.dev-articles-2016-en/blob/main/pvs-studio/pvs-studio.md)<!-- https://harrix.dev/en/articles/2016/pvs-studio/ -->
```

What does it look like: [Review of PVS-Studio](https://github.com/Harrix/harrix.dev-articles-2016-en/blob/main/pvs-studio/pvs-studio.md)<!-- https://harrix.dev/en/articles/2016/pvs-studio/ -->.
