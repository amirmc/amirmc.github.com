module Jekyll

  class TagFeeds < Generator
  
    safe true

      site.tags.each do |tag|
        make_feeds(site, "tags", tag)
      end
    end

    def make_feeds(site, type, posts) 
      posts[1] = posts[1].sort_by { |p| -p.date.to_f }     
      atomize(site, type, posts)
    end

    def atomize(site, type, posts)
      path = "/#{type}/#{posts[0]}"
      atom = AtomPage.new(site, site.source, path, type, posts[0], posts[1])
      site.pages << atom
    end
  end
  
  class AtomPage < Page
    def initialize(site, base, dir, type, val, posts)
      @site = site
      @base = base
      @dir = dir
      @name = '#{val}-atom.xml'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "atom_group.xml")
      self.data[type] = val
      self.data["grouptype"] = type
      self.data["posts"] = posts
    end
  end
end
