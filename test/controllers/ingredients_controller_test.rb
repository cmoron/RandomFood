require 'test_helper'

class IngredientsControllerTest < ActionController::TestCase
  setup do
    @ingredient = ingredients(:one)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @user = FactoryGirl.create(:admin)
    sign_in @user
  end

  teardown do
    sign_out @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredients)
  end

  #Add testing routes SHOW
  test "should route to ingredients" do
    assert_routing '/ingredients/1', { :controller => "ingredients", :action => "show", :id => "1" }
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient" do
    assert_difference('Ingredient.count') do
      post :create, ingredient: { name: @ingredient.name }
    end

    assert_redirected_to ingredient_path(assigns(:ingredient))
  end

  test "should show ingredient" do
    get :show, id: @ingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient
    assert_response :success
  end

  test "should update ingredient" do
    patch :update, id: @ingredient, ingredient: { name: @ingredient.name }
    assert_redirected_to ingredient_path(assigns(:ingredient))
  end

  test "should destroy ingredient" do
    assert_difference('Ingredient.count', -1) do
      delete :destroy, id: @ingredient
    end


    assert_redirected_to ingredients_path
  end
end
