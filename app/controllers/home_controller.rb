class HomeController < ApplicationController

  def index
  end

  def demo
    @proposition = Proposition.first
    redirect_to proposition_path(@proposition.slug)
  end

end
