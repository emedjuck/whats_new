class WhatsNewItemsController < ApplicationController
  def index
    @whats_new_live = WhatsNewItem.where(release: 'live')
    @whats_new_internal = WhatsNewItem.where(release: 'internal')
    respond_to do |format|
      format.html
      format.json {
        if params[:release] == "internal"
          render :json => @whats_new_internal
       else 
         render :json => @whats_new_live
       end
     }
   end  
  end

  def new
    @item = WhatsNewItem.new
  end

  def create
    @item = WhatsNewItem.new whats_new_item_params
    @item.release = 'internal'
    @item.save
    redirect_to action:  'index'
    flash[:notice] = "#@item.title saved."
  end

  def reorder
    changes = ActiveSupport::JSON.decode(params[:changes])
    console.log(changes)
  end

  def destroy
    @item = WhatsNewItem.find params[:id]
    @item.destroy
  end

  def edit
    @item = WhatsNewItem.find params[:id]
  end

  def update
    @item = WhatsNewItem.find params[:id]

    if @item.update whats_new_item_params
      flash[:notice] = "#{@item.title} saved."
      redirect_to action:  'index'
    else
      render 'edit'
    end
  end

  private
    def whats_new_item_params
      params.require(:whats_new_item).permit(:title, :description, :experiment, :link, :start_date, :end_date)
    end

end
