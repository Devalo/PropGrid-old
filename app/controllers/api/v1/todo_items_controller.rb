class Api::V1::TodoItemsController < ApplicationController
  before_action :authenticate_user! # Makes sure the user is logged in to see this
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  def index
  #  @todo_items = TodoItem.all
    @todo_items = current_user.todo_items.all
    # @todo_items = current_user.property_units
    #@todo_items = @property_unit.user_id

    #  @property_units = current_user.property_units
  end

  def show
    if authorized?
      respond_to do |format|
        format.json { render :show }
      end
    else
      handle_unauthorized
    end
  end

  def create

    @todo_item = current_user.todo_items.build(todo_item_params.merge(user_id: current_user.id))
    if authorized?
      respond_to do |format|
        if @todo_item.save
          format.json { render :show, status: :created, location: api_v1_todo_item_path(@todo_item) }
        else
          format.json { render json: @todo_item.errors, status: :unprocessable_entity }
        end
      end
    else
      handle_unauthorized
    end
  end

  def update
    if authorized?
      respond_to do |format|
        if @todo_item.update(todo_item_params)
          format.json { render :show, status: :ok, location: api_v1_todo_item_path(@todo_item) }
        else
          format.json { render json: @todo_item.errors, status: :unprocessable_entity }
        end
      end
      handle_unauthorized
    end
  end

  def destroy
    if authorized?
      @todo_item.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      handle_unauthorized
    end
  end

  private

  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end
# Current user needs to be the same as the user id stored in property unit
  def authorized?
     @todo_item.user == current_user
  end

  # If the request is not autorized, return unauthorized jbuilder with status 401
  def handle_unauthorized
    unless authorized?
      respond_to do |format|
        format.json { render :unauthorized, status: 401 }
      end
    end
  end

  def todo_item_params
    params.require(:todo_item).permit(:title, :complete, :user_id, :property_unit_id)
  end
end
