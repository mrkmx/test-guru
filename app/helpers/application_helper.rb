module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "<a href='https://github.com/#{author}/#{repo}' target='_blank' rel='noopener noreferrer'>#{repo}</a>".html_safe
  end
end
