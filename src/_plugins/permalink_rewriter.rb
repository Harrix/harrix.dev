module Jekyll
  class PermalinkRewriter < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      site.posts.docs.each do |item|
        @basename = item.basename
        @permalink = item.data["permalink"]
        @slug = item.data["slug"]
        @locale = item.data["locale"]
        @categories = item.data["categories"]

        if @categories.include? "blog"
          @subsite = "blog"
          @subsite_slug = "/:year/:title/"
        end
        if @categories.include? "games"
          @subsite = "games"
          @subsite_slug = "/:title/"
        end
        if @categories.include? "science"
          @subsite = "science"
          @subsite_slug = "/:year/:title/"
        end

        if @basename.include? ".en"
          item.data["locale"] = "en"
          item.data["slug"] = @slug.sub(".en", "")
          item.data["permalink"] = "en/#{@subsite}#{@subsite_slug}"
        else
          item.data["locale"] = "ru"
          item.data["slug"] = @slug.sub(".en", "")
          item.data["permalink"] = "#{@subsite}#{@subsite_slug}"
        end
      end
    end
  end
end