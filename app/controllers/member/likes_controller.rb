class Member::LikesController < ApplicationController
  before_action :authenticate_member!

  def index
    @member = current_member
    @likes = Like.All.where(member_id: @member.id).page(params[:page]).per(8)
    #    @dog = Dog.All.find_by(id: params[:id])
    #    if @likes == nil
    #      redirect_to member_likes_path
    #    end

    # @dog = Dog.All.find_by(id: params[:id])
    # if @dog == nil
    #   redirect_to member_likes_path
    # end
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
