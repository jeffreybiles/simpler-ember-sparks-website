ActiveAdmin.register Tag do
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
    column :name
    column :tag_type
    column :permalink
    column :most_recent_publish_date
    column :thumbnail_image
    actions
  end

  controller do
    def permitted_params
      params.permit!
    end

    def find_resource
      @post = Tag.find_by_permalink(params[:id]) || Post.find(params[:id])
    end
  end

  show do
    attributes_table do
      row :name do |t|
        link_to t.name, tag_path(t)
      end
      row :description
      row :tag_type
      row :permalink
      row :most_recent_publish_date
      row :thumbnail_image
    end
  end

  form do |f|
    f.inputs "tag" do
      f.input :name
      f.input :description
      f.input :tag_type
      f.input :most_recent_publish_date
      f.input :thumbnail_image
    end
    f.actions
  end
end
