class CosmeticsController < ApplicationController
 
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @cosmetics = Cosmetic.all
        @tags = Tag.all
        cosmetic_ids = []
        @cosmetics = Cosmetic.where("genre LIKE ? ",'%' + params[:search] + '%')if params[:search]

        if params[:tag_ids]
            @cosmetics = []
            params[:tag_ids].each do |key, value|      
              @cosmetics += Tag.find_by(name: key).cosmetics if value == "1"
            end
            @cosmetics.uniq!
            @cosmetics.where!(id: cosmetic_ids) if cosmetic_ids.present?
        end

        @cosmetics = Kaminari.paginate_array(@cosmetics).page(params[:page]).per(5)

        if params[:tag]
            Tag.create(name: params[:tag])
        end
  
          


    end

    def top
    end

    def new
        @cosmetic = Cosmetic.new
        
        if params[:tag]
          Tag.create(name: params[:tag])
        end

    end

  def create
    cosmetic = Cosmetic.new(cosmetic_params)
    cosmetic.user_id = current_user.id
    if cosmetic.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
    @comments = @cosmetic.comments
    @comment = Comment.new
  end

  def edit
    @cosmetic = Cosmetic.find(params[:id])
  end

  def update
    cosmetic = Cosmetic.find(params[:id])
    if cosmetic.update(cosmetic_params)
      redirect_to :action => "show", :id => cosmetic.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    cosmetic = Cosmetic.find(params[:id])
    cosmetic.destroy
    redirect_to action: :index
  end

  private
  def cosmetic_params
    params.require(:cosmetic).permit(:name, :cost, :nayami, :image, :about, :genre, tag_ids: [])
  end

end
