module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener noreferrer'
  end

  def flash_message(type)
    content_tag :div, flash[type], class: "flash flash__#{type}" if flash[type]
  end
end
