class ProductsController < InheritedResources::Base
  def index
    @products = Product.search(params[:search], params[:category])
    @products = @products.order(:created_at).page(params[:page])
    @categories = Category.distinct.pluck(:name)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock)
  end
end
