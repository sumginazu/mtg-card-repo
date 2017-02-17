module ApplicationHelper
  #page title
  def full_title(page_name)
    base_title = "MTG Card Repo"
    page_name.empty? ? base_title : "#{page_name} | #{base_title}"
  end
end
