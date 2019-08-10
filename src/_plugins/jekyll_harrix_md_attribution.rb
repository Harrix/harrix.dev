require 'json'

module Jekyll
  class JekyllHarrixMdAttribution
    @@converter = nil
    @@post = nil

    class << self
      def process_attribution(content)
        filename = "#{File.dirname(@@post.path)}/attribution.json"
        if File.file?(filename)
          attribution_html = "<ul>"
          JSON.parse(File.read(filename)).each do |item|
            link = "<a href=\"#{item['url']}\">#{item['title']}</a>"
            link_author = "<a href=\"#{item['authorUrl']}\">#{item['author']}</a>"
            link_licence = "<a href=\"#{item['licenceUrl']}\">#{item['licence']}</a>"
            attribution_html  += "<li>#{link} by #{link_author} / #{link_licence} (#{item['urlDate']})</li>"
          end
          content += attribution_html + "</ul>"
        end

        content
      end

      def process(content, is_process_blocks = true)
        process_attribution(content)
      end
    end
  end
end

Jekyll::Hooks.register :site, :pre_render do |site|
  converter = site.find_converter_instance(Jekyll::Converters::Markdown)
  Jekyll::JekyllHarrixMdAttribution.class_variable_set(:@@converter, converter)
end

Jekyll::Hooks.register([:posts], :pre_render) do |post|
  Jekyll::JekyllHarrixMdAttribution.class_variable_set(:@@post, post)
  post.content = Jekyll::JekyllHarrixMdAttribution.process(post.content)
end
