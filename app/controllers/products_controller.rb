class ProductsController < InheritedResources::Base
  def index
    @products = Product.search(params[:product], params[:category])
    if @products.empty?
      flash.now[:notice] = "Your search options show 0 results, try searching for 'shoes' and/or
      'clothing' category."
    end
    @products = @products.order(:created_at).page(params[:page])
    @categories = Category.distinct.pluck(:name)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock)
  end
end
