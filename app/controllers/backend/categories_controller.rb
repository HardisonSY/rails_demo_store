class Backend::CategoriesController < Backend::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to backend_categories_path
    else
      render :new
    end
  end

  def edit
    # TODO
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end

  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end
