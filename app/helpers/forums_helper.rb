module ForumsHelper
  def forum_link(forum)
    home = "fas fa-home"
    work = "fas fa-briefcase"
    adventure = "fas fa-hiking"
    other = "fas fa-campground"

    classes = forum == current_forum ? "forum-name font-weight-bold text-primary" : "forum-name"
    forum_name = forum.group.downcase

    if forum_name == "general"
      font_awesome_class = home
    elsif forum_name == "work" || forum_name == "professional"
      font_awesome_class = work
    elsif forum_name == "adventures" || forum_name == "social"
      font_awesome_class = adventure
    else
      font_awesome_class = other
    end
    
    link_to city_forum_posts_path(forum.city, forum), class: classes  do 
      content_tag(:i, '', class: font_awesome_class + " fa-fw") + " " + forum.group
    end
  end
end