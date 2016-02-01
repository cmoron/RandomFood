class StaticPagesController < ApplicationController
  autocomplete :ingredient, :name
  def home
  end
end
