require 'sitemap_generator'
=begin
SitemapGenerator::Sitemap.default_host = 'http://cursa.me'
SitemapGenerator::Sitemap.create do
  add '/es', :changefreq => 'daily', :priority => 0.9
  add '/es/contact', :changefreq => 'weekly'
  add '/es/features', :changefreq => 'weekly'
  add '/es/pate', :changefreq => 'weekly'
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
=end