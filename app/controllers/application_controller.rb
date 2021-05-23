class ApplicationController < ActionController::Base
  # GET /
  def index
    link = "<a href=\"/documents\">Browse documents</a>".html_safe
    render html: link
  end
end
