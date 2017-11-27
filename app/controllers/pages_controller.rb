class PagesController < ApplicationController
  def index
    #show all blog pages
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    #show single blog page
  end

  def edit
    #shows a pre filled form to edit the page
    @page = Page.find(params[:id])
  end

  def update
    #take data from the form and update the page in our database
    @page = Page.find(params[:id])
    if @page.update(page_params)

      redirect_to page_path(@page)
    else
      render 'edit'
    end
  end

  def new
    #shows a blank form to create a new page
    @page = Page.new
  end

  def create
    #take data from form and create a new page in our database
    @page = Page.new(page_params)
    if @page.save
      #success
      redirect_to pages_path
    else
      #fail
      render 'new'
    end
  end

  def destroy
    #find page by id and removes it from the databse
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private
    def page_params
      params.require(:page).permit(:title, :author, :content, :public)
    end
end
