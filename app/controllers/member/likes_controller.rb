class Member::LikesController < ApplicationController
  before_action :authenticate_member!, except: :index

  def create
    @like = current_member.likes.create(dog_id: params[:dog_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @dog = Dog.find(params[:dog_id])
    @like = current_member.likes.find_by(dog_id: @dog.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
