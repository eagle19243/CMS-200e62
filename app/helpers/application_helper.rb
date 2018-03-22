module ApplicationHelper

  MARKDOWN = Redcarpet::Markdown.new(Redcarpet::Render::HTML) unless defined?(MARKDOWN)

  def smarty(stringish)
    Redcarpet::Render::SmartyPants.render(stringish.to_s).html_safe
  end
  alias_method :s, :smarty

  def markdown(stringish)
    MARKDOWN.render(stringish.to_s).html_safe
  end
  alias_method :m, :markdown

  def format(stringish)
    smarty(markdown(stringish))
  end
  alias_method :f, :format

  def format_title(stringish)
    text = format(stringish)
    text = Regexp.new('^<p>(.*)<\/p>$').match(text)[1] rescue text
    text.html_safe
  end
  alias_method :ft, :format_title

  def strip_markdown(stringish)
    strip_tags(m(stringish)).html_safe
  end

  def link_to_nav(name, path)
    link_to(name, path, class: (current_page?(path) ? 'current' : ''), title: name)
  end

  def page_title
    content_for(:page_title) ||
      "Midtown East Condos & Apartments For Sale | Upper East Side, NYC Real Estate - 200 East 62nd Street"
  end

  def page_description
    content_for(:page_description) ||
      "200 East 62 Street is a Luxury Condominium residence tower nestled between Midtown East and Uptown in Manhattan. The building is designed by Messana O'Rorke, and offers luxury amenities."
  end

  def on_home_page?
    @page && @page.slug == 'home'
  end

  def on_trailer?
    @page && @page.slug.to_s == 'trailer'
  end

  def body_classes
    klasses = []
    klasses << 'on-home' if on_home_page?
    klasses << 'trailer' if on_trailer?
    klasses.join(' ')
  end

  def alt_text_for(block)
    block.alternate && block.alternate.empty? ? strip_tags(block.caption) : block.alternate
  end
end
