=begin
# Examples of extended markdown

## Video as images instead of gif

```md
[Result of the compile](img/result.mp4)

[Result of the compile](img/result.webm)

[Result of the compile](img/result.ogg)
```

## Embed elements

If the line begins with a link, decorated with `<>`, the program tries to embed the element.

The examples list all currently available services:

```md
<https://codepen.io/Harrix/pen/GBwrwy>

<https://jsfiddle.net/Harrix/75402hj3/>

<https://drive.google.com/file/d/1kM5DMzYBNrTM8UZpl55xZWhs8MDHacHL>

<https://drive.google.com/open?id=1kM5DMzYBNrTM8UZpl55xZWhs8MDHacHL>

<https://vimeo.com/91729159>

<https://www.youtube.com/watch?v=dQw4w9WgXcQ>

<https://music.yandex.ru/album/5363957>

<https://gist.github.com/esperlu/943776>

<https://www.instagram.com/p/Bm4csavAxVd/>

<https://twitter.com/Windows/status/1040019810267131908>

<https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/268888981>
```

The optional number after the reference indicates the height of the embedded element (if it allows embed code):

```md
<https://codepen.io/Harrix/pen/GBwrwy> 500
```

## Special text blocks

There are two kinds of block: style Microsoft style with the horizontal line.

### Note block

```md

---

**The title of this note** <!-- !note -->

It works with almost **all** [markdown](https://en.wikipedia.org/wiki/Markdown) flavours.

Next line

---

```

### Important block

```md

---

**The title of this note** <!-- !important -->

Essential information required for user success

Next line

---

```

### Warning block

```md

---

**The title of this note** <!-- !warning -->

Dangerous certain consequences of an action

Next line

---

```

### DETAILS (spoiler) block

```md

---

**This text is visible** <!-- !details -->

This text is hidden from the user

Next line

---

```

## Gallery

```md
[!gallery](name_of_subfolder)
```
=end
module Jekyll
  class JekyllHarrixMarkdown
    @@converter = nil
    @@post = nil

    class << self
      def process_mp4(content)
        regex = /\[(.*)\]\((.*).(mp4|webm|ogg)\)/
        template = '<video autoplay loop muted playsinline><source src="\2.\3" type="video/\3">\1</video>'

        content.gsub(regex, template)
      end

      def process_embed(content)
        regex_string = 'https\:\/\/codepen.io\/(?<user>.*)\/pen\/(?<slug>.*)'
        template = '<p data-height="%{height}" data-theme-id="light" data-slug-hash="\k<slug>" data-default-tab="result" data-user="\k<user>" data-pen-title="\k<slug>" class="codepen">See the Pen <a href="https://codepen.io/\k<user>/pen/\k<slug>/">\k<slug></a></p><script async src="https://static.codepen.io/assets/embed/ei.js"></script>'
        height_default = "400"
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https\:\/\/jsfiddle.net\/(?<user>.*)\/(?<slug>.*)\/'
        template = '<iframe width="100%%" height="%{height}" src="//jsfiddle.net/\k<user>/\k<slug>/embedded/result,html,css,js/" allowfullscreen="allowfullscreen" allowpaymentrequest frameborder="0"></iframe>'
        height_default = "400"
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https\:\/\/drive.google.com\/file\/d\/(?<slug>.*?)'
        template = '<iframe src="https://drive.google.com/file/d/\k<slug>/preview" allowfullscreen="true" width="100%%" height="%{height}"></iframe>'
        height_default = "400"
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https:\/\/drive.google.com\/open\?id=(?<slug>.*?)'
        template = '<iframe src="https://drive.google.com/file/d/\k<slug>/preview" allowfullscreen="true" width="100%%" height="%{height}"></iframe>'
        height_default = "400"
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https:\/\/vimeo.com\/(?<slug>.*?)'
        template = '<iframe src="//player.vimeo.com/video/\k<slug>" width="100%%" height="%{height}" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
        height_default = "400"
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https:\/\/www.youtube.com\/watch\?v=(?<slug>.*?)'
        template = '<iframe width="100%%" height="%{height}" src="https://www.youtube.com/embed/\k<slug>?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'
        height_default = "400"
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https:\/\/music.yandex.ru\/album\/(?<slug>.*?)'
        template = '<iframe frameborder="0" style="border:none;width:100%%;height:%{height};" width="100%%" height="%{height}" src="https://music.yandex.ru/iframe/#album/\k<slug>/"><a href="https://music.yandex.ru/album/\k<slug>">Listen</a> on Yandex.Music</iframe>'
        height_default = "600"
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https:\/\/gist.github.com\/(?<user>.*?)\/(?<slug>.*?)'
        template = '<script src="https://gist.github.com/\k<user>/\k<slug>.js"></script>'
        height_default = ""
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https:\/\/www.instagram.com\/p\/(?<slug>.*?)\/'
        template = '<blockquote class="instagram-media" data-instgrm-captioned data-instgrm-permalink="https://www.instagram.com/p/\k<slug>/?utm_source=ig_embed_loading" data-instgrm-version="12" style="background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:540px; min-width:326px; padding:0; width:99.375%%; width:-webkit-calc(100%% - 2px); width:calc(100%% - 2px);"></blockquote><script async defer src="//www.instagram.com/embed.js"></script>'
        height_default = ""
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https:\/\/twitter.com\/(?<user>.*?)\/status\/(?<slug>.*?)'
        template = '<blockquote class="twitter-tweet"><a href="https://twitter.com/\k<user>/status/\k<slug>">See on Twitter</a></blockquote><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>'
        height_default = ""
        content = replace_regex_embed(content, template, regex_string, height_default)

        regex_string = 'https:\/\/w.soundcloud.com\/player\/\?url=https%3A\/\/api.soundcloud.com\/tracks\/(?<slug>.*?)'
        template = '<iframe width="100%%" height="%{height}" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%%3A//api.soundcloud.com/tracks/\k<slug>&color=%%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>'
        height_default = "300"
        content = replace_regex_embed(content, template, regex_string, height_default)

        content
      end

      def generate_regex_embed(regex_string, is_with_height)
        Regexp.new is_with_height ? "^<#{regex_string}> (?<height>\\d*)$" : "^<#{regex_string}>$"
      end

      def replace_regex_embed(content, template, regex_string, height_default)
        content.gsub!(generate_regex_embed(regex_string, false), template % {height: height_default})
        content.gsub!(generate_regex_embed(regex_string, true), template % {height: '\k<height>'})

        content
      end

      def process_gallery(content)
        regex = /^\[!gallery\]\((.*?)\)$/
        content.scan(regex).each do |match|
          path = "#{File.dirname(@@post.path)}/#{match[0]}"
          list_files = Dir.entries(path).reject { |e| e == "." || e == ".." }
          gallery = ""
          list_files.each do |file|
            thumb = File.directory?(path + "-thumb") ? "#{match[0]}-thumb/#{file}" : "#{match[0]}/#{file}"
            gallery << "<li><a href=\"#{match[0]}/#{file}\"><img src=\"#{thumb}\" alt=\"\"></a></li>"
          end
          content.sub!("[!gallery](#{match[0]})", "<ul>#{gallery}</ul>")
        end

        content
      end

      def process_blocks(content)
        template = "<div class=\"is-note\">\n<p>%{title}</p>\n%{html}\n</div>"
        marker = "<!-- !note -->"
        content = process_block_hr(content, marker, template)

        template = "<div class=\"is-important\">\n<p>%{title}</p>\n%{html}\n</div>"
        marker = "<!-- !important -->"
        content = process_block_hr(content, marker, template)

        template = "<div class=\"is-warning\">\n<p>%{title}</p>\n%{html}\n</div>"
        marker = "<!-- !warning -->"
        content = process_block_hr(content, marker, template)

        template = "<details>\n<summary>%{title}</summary>\n%{html}\n</details>"
        marker = "<!-- !details -->"
        content = process_block_hr(content, marker, template)

        content
      end

      def process_block_hr(content, marker, template)
        regex = /^---\n\n\*\*([^\r\n]*?)\*\* #{Regexp.quote(marker)}\n\n(.*?)\n\n---$/m
        content.scan(regex).each do |match|
          html = process(match[1], false)
          content.sub!("---\n\n\*\*#{match[0]}\*\* #{marker}\n\n#{match[1]}\n\n---", template % {title: match[0], html: html})
        end

        content
      end

      def process(content, is_process_blocks = true)
        content = process_mp4(content)
        content = process_embed(content)
        content = process_gallery(content)
        if is_process_blocks
          content = process_blocks(content)
        else
          content = @@converter.convert(content)
        end

        content
      end
    end
  end
end

Jekyll::Hooks.register :site, :pre_render do |site|
  converter = site.find_converter_instance(Jekyll::Converters::Markdown)
  Jekyll::JekyllHarrixMarkdown.class_variable_set(:@@converter, converter)
end

Jekyll::Hooks.register([:posts], :pre_render) do |post|
  Jekyll::JekyllHarrixMarkdown.class_variable_set(:@@post, post)
  post.content = Jekyll::JekyllHarrixMarkdown.process(post.content)
end
