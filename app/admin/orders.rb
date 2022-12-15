ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  belongs_to :customer, optional: true
  permit_params :taxes, :grandTotal, :quantity, :customer_id,
                products_attributes: %i[id name price stock category_id _destroy],
                customer_attributes: %i[name address]
  #
  # or
  #
  # permit_params do
  #   permitted = [:date, :price, :quantity, :customer_id, :product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.semantic_errors
    f.inputs "Order" do
      f.has_many :customer, heading:       "Customer",
                            allow_destroy: true,
                            new_record:    true do |a|
        a.input :name
        a.input :address
      end
      f.has_many :products, heading:       "products",
                            allow_destroy: true,
                            new_record:    true do |a|
        a.input :id, as: :select, collection: Product.select(:name).uniq

        a.input :price
        a.input :stock
        a.input :category_id
      end
      f.input :quantity
      f.input :taxes
      f.input :grandTotal
    end
    f.actions
  end
end
