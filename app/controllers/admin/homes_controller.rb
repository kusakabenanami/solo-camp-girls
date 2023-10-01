class Admin::HomesController < ApplicationController

  def top
    @users = User.all
    search_term = params[:search].to_s.strip # .to_s で nil を空文字列に変換し、.strip で前後の空白を削除

    if search_term.blank?
      # 検索条件が空の場合はすべてのコメントを表示
      @camp_comments = @users.map do |user|
        user.camp_comments
      end.flatten
    else
      # 検索条件が存在する場合は部分一致で検索
      @camp_comments = @users.map do |user|
        user.camp_comments.where("comment LIKE ?", "%#{search_term}%")
      end.compact.flatten
    end
  end
end