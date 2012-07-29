class HomeController < ApplicationController


  def index
    # index.html.erb
  end

  def demo
    @proposition = Proposition.first
    redirect_to proposition_path(@proposition.slug)
  end

end
