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
  end

  def create
  end

  def update
  end

  def destroy
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
end
