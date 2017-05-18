class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
      @rooms = Room.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @rooms = Room.where(:category_id=> @category_id).order("created_at DESC")
    end
    @rooms1 = Room.where(:category_id=> 1).order("created_at DESC")
    @rooms2 = Room.where(:category_id=> 2).order("created_at DESC")
    @rooms3 = Room.where(:category_id=> 3).order("created_at DESC")
  end

  def show
    if @room.reviews.blank?
      @average_review = 0
    else
      @average_review = @room.reviews.average(:rating).round(2)
    end
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
    params.require(:room).permit(:nombre, :precio, :lat, :long, :ubicacion, :descripcion,
                                 :category_id, :room_img)
  end

  def find_room
    @room = Room.find(params[:id])
  end

end
