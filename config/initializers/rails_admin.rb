RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  config.authorize_with do
    redirect_to main_app.root_path unless current_user && current_user.role == "admin"
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Product' do
    exclude_fields :image
    exclude_fields :orderings
    exclude_fields :created_at
    exclude_fields :updated_at
    exclude_fields :sizes
    field :sizings do
      associated_collection_scope do
        product = bindings[:object]
        Proc.new { |scope|
          scope = scope.where(product: product)
        }
      end
    end
    field :price do
      pretty_value do
        value/100.0
      end
    end
  end

  config.model 'User' do
      field :id
      field :username
      field :email
      field :shippings
      field :role
      field :orders

  end

  config.model 'Size' do
    object_label_method do
      :size
    end
    field :id
    field :size
    field :products
  end

  config.model 'Shipping' do
    field :user do
      pretty_value do
        value.try(:username)
      end
    end
    field :address1
    field :address2
    field :city
    field :state
    field :zipcode 
  end

  config.model 'Sizing' do
    object_label_method do
      :admin_display
    end
    field :size
    field :quantity
    field :product
  end

end
