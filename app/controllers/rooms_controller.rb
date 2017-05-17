class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all.order("created_at DESC")
  end

  def show
  end

  def new
    @room = current_usuario.rooms.build
    @categories = Category.all.map{|c| [c.name, c.id]}
  end

  def create
    @room = current_usuario.rooms.build(room_params)
    @room.category_id = params[:category_id]

    if @room.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit
    @categories = Category.all.map{|c| [c.name, c.id]}
  end

  def update
    @room.category_id = params[:category_id]
    if @room.update(room_params)
      redirect_to rooms_path(@room)
    else
      render 'edit'
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:nombre, :precio, :lat, :long, :ubicacion, :descripcion, :category_id)
  end

  def find_room
    @room = Room.find(params[:id])
  end

end
