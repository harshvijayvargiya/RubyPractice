class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :nested => :story

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
    authorize! :index, @story
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    # authorize! :read, @story
  end

  # GET /stories/new
  def new
    @story = Story.new
     authorize! :new, @story
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story 
         successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def active
    @story = Story.find(params[:id])
    @story.update(is_active: true)
    redirect_to story_path(@story), flash: {notice: "Active story now"}
    @stories = Story.where(active: true)
    @story = Story.new
  end

  def inactive
    @story = Story.find(params[:id])
    @story.update(is_active: false)
    redirect_to story_path(@story), flash: {notice: "Inactive story now"}
    @stories = Story.where(active: false)
    @story = Story.new
  end

  def story_by_status
    
    if params[:status] == "active"
      @stories = Story.active_stories
    elsif params[:status] == "inactive"
      @stories = Story.inactive_stories
    else
      @stories = Story.all
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :content, :status)
    end
end
