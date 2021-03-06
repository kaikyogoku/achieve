class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
    render json: @blogs
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

 def create
    @blog = Blog.new(blogs_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render 'new'
    end
 end

  def edit
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end

  def update
    # edit, update, destroyで共通コード

    if @blog.update(blogs_params)
      redirect_to blogs_path, notice: "ブログを更新しました！"
    else
      render 'edit'
    end
    
  end
    
  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?  
  end
  

  private
    def blogs_params
      params.require(:blog).permit(:title, :content, :confirm)
    end

    # idをキーとして値を取得するメソッド
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
