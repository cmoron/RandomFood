class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :search]
  before_action :check_auth, only: [:create, :edit, :update, :destroy]

  #before_filter do
  #redirect_to home_url unless current_user && current_user.admin?
  #end

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  def search
    # Maybe some of this code should be in model
    search_string = params[:search]
    @ingredients = Array.new
    @recipes = Array.new
    if !search_string.nil?
      ing_strings = search_string.split(',')
      for ing_string in ing_strings
        ingredient = Ingredient.where('lower(name) = ?', ing_string.downcase.strip).first
        if !ingredient.nil?
          @ingredients << ingredient
        end
      end
    end
    unless @ingredients.empty?
      @ingredients.each do |ing|
        recipes = Recipe.joins(:ingredients).where(:ingredients => {:id => ing.id})
        if @recipes.empty?
          @recipes = recipes
        else
          @recipes &= recipes
        end
      end
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.includes(:ingredients).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:name)
  end

  def check_auth
    if  not current_user.admin?
      flash[:notice] = "Sorry, you need to be admin to play with recipes"
      redirect_to recipes_path
    end
  end
end
