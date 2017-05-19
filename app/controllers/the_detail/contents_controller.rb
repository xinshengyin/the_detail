class TheDetail::ContentsController < TheDetail::BaseController
  before_action :set_detail
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @contents = @detail.contents
  end

  def show
  end

  def new
    @content = @detail.contents.build
  end

  def create
    @content = @detail.contents.build(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
        format.js
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    
  end

  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_detail
    @detail = Detail.find params[:detail_id]
  end

  def set_content
    @content = Content.find(params[:id])
  end
  
  def content_params
    params[:content].permit(:title, :body, :key, :type)
  end

end