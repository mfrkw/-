class Member::LikesController < ApplicationController
  before_action :authenticate_member!
  
  def index
    @member =  current_member
    @likes = Like.where(member_id: @member.id)
  end 

  def create
    @like = current_member.likes.create(dog_id: params[:dog_id])
    @dog = Dog.find(params[:dog_id])
    
    # redirect_back(fallback_location: root_path) 非同期化
  end

  def destroy
    @dog = Dog.find(params[:dog_id])
    @like = current_member.likes.find_by(dog_id: @dog.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end

  
end
