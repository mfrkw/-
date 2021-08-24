class Member::MembersController < ApplicationController
  before_action :authenticate_member!
  
  def show
    @member = Member.find(params[:id])
    
  end
  
  def edit 
    @member = Member.find(params[:id])
  end 
  
  def update
    member = Member.find(current_member.id)
    if member.update(member_params)
       flash[:notice] = "登録情報を変更しました"
       redirect_to member_member_path
    else
      flash[:alert] = "登録情報を変更できませんでした"
      render :edit 
    end
  end
  
  def out
    @member = Member.find(current_member.id)
    @member.update(is_deleted: true)
    # ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました！またのご利用お待ちしております。"
    
    redirect_to root_path
    
  end
  
  private
  def member_params
  params.require(:member).permit(:last_name, :first_name, :telephone_number, :postal_code, :address, :email)
  end
  
end
