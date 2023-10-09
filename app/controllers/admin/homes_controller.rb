class Admin::HomesController < ApplicationController

  def top
    @camp_comment = CampComment.all
    @camp_comment = @camp_comment.page(params[:page]).per(10)

    search_term = params[:search].to_s.strip # .to_s で nil を空文字列に変換し、.strip で前後の空白を削除

    if search_term.blank?
      # 検索条件が空の場合はすべてのコメントを表示
      @camp_comments = CampComment.all
    else
      # 検索条件が存在する場合は部分一致で検索
      @camp_comments = CampComment.where("comment LIKE ?", "%#{search_term}%")
    end
  end

end

