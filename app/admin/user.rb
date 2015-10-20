ActiveAdmin.register User do
  # permit_params :title, :publish_date, :description, :transcript, :thumbnail_image, :links

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column :id
    column :email
    column :subscribed
    column :stripe_customer_id
    column :created_at
    column :updated_at
    column :last_sign_in_at
    column :organization_id
    column :organization_permission_level
    default_actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

  show do
    attributes_table do
      row :id
      row :email
      row :subscribed
      row :stripe_customer_id
      row :created_at
      row :updated_at
      row :last_sign_in_at
      row :organization do |t|
        t.organization.try(:name)
      end
      row :organization_permission_level
      row :invitation_status
    end
  end

  form do |f|
    f.inputs "post" do
      f.input :email
      f.input :subscribed
      f.input :stripe_customer_id
    end
    f.actions
  end
end
