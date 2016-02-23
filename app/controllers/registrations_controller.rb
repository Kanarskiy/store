class RegistrationsController < Devise::RegistrationsController
    protected

    def after_update_path_for(resource)
        customer_products_path(current_customer)
    end
end