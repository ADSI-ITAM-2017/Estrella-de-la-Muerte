class ReviewsController < ApplicationController
  before_action :find_room
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.room_id = @room.id
    @review.usuario_id = current_usuario.id

    if @review.save
      redirect_to room_path(@room)
    else
      render 'new'
    end

  end

  def edit
  end

  def update

    if @review.update(review_params)
      redirect_to room_path(@room)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to room_path(@room)
  end


  private

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def find_room
      @room = Room.find(params[:room_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end

end
