module PagesHelper

  def nav_for(page, options = {})
    nav = "<ul id='nav-#{page.permalink}' class='nav'>"
    nav << content_tag('li', link_to("Home", Page.root)) if options[:include_root]
    page.children.each do |child|
      # Setup Link
      link = link_to(child.title, child.path) 
      # Add Edit Link if needed
      link << " - #{link_to 'Edit', edit_page_path(child) }" if logged_in? && options[:editable]
      # Push into html if page is active
      nav << content_tag('li',  link, :id => "page_#{child.id}") if child.active
      # Recurse if required
      nav << nav_for(child, :recursive => options[:recursive], :editable => options[:editable], :include_root => false) if options[:recursive]
    end
    nav += '</ul>'
    nav
  end
  
  def sitemap
    nav_for(Page.root, :recursive => true, :editable => true, :include_root => true)
  end
  
  def top_level_nav
    nav_for(Page.root, :include_root => true)
  end
  
  def sub_nav_for(page)
    nav = "<div class='subnav'"
    if page.children.size == 0
      nav << "<h3>#{link_to page.parent.title, page.parent.path}</h3>"
    else 
      nav << "<h3>#{link_to page.title, page.path}</h3>"
    end
    nav << '<ul>'
    pages = page.children.size > 0 ? page.children : page.parent.children
    pages.each do |child|
      nav << content_tag('li', link_to(child.title, child.path), :class => "#{'current' if page == child}")  if child.active
    end
    nav += '</ul></div>'
    nav
  end
  

  
end
