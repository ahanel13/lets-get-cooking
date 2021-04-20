class RecipesController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :authenticate_user!, only: [:show, :index]
    before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    @Allrecipes = Recipe.all
    @recipesByName = Array.new
    @recipesByIngredient = Array.new
    @recipes = Array.new

    if params[:search_by_ingredients] && params[:search_by_ingredients][:ingredient_id] != [""]
      @Allrecipes.each do |recipe|
        @recipesByIngredient.push(recipe)

        @IngredientCheck = recipe.ingredients.select{|ingredient| params[:search_by_ingredients][:ingredient_id].include?(ingredient.id) == true}

        if @IngredientCheck.length() != params[:search_by_ingredients][:ingredient_id].length()-1
          @recipesByIngredient.delete(recipe)
        end
      end

      if params[:search_by_name] && params[:search_by_name] != ""
        @recipesByName = @Allrecipes.where("name LIKE ?", "%#{params[:search_by_name]}%")
        @recipes = @recipesByName & @recipesByIngredient
        puts "*"*100
      
      else
        @recipes = @recipesByIngredient
      end

    elsif params[:search_by_name] && params[:search_by_name] != ""
      @recipesByName = @Allrecipes.where("name LIKE ?", "%#{params[:search_by_name]}%")
      @recipes = @recipesByName
    
    else
      @recipes = @Allrecipes
    end
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    puts @recipe.inspect
    puts @recipe.comments.inspect
  end

  # GET /recipes/new
  def new
    :authenticate_user!
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @units = Unit.all
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :preptime, :cooktime, :serving, :description, :image, steps_attributes:[:id, :instruction, :_destroy], recipe_ingredients_attributes:[:id, :unit_id, :quantity, :ingredient_id, :_destroy], search_by_ingredients: [])
      # params.permit(:name, :preptime, :cooktime, :serving, :description, :image, steps_attributes:[:id, :instruction, :_destroy], recipe_ingredients_attributes:[:id, :unit_id, :quantity, :ingredient_id, :_destroy], search_by_ingredients: [])
    end
end
