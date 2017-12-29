class PoemsController < ApplicationController
  def index
    @poems = Poem.all
  end

  def show
    set_poem
  end
  
  private
    def set_poem
      @poems = Poem.find(params[:id])
    end
end