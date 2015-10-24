ActiveAdmin.register Post do
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
    column :free
    column :guid
    column :code do |t|
      t.code.present? && t.code != 'null'
    end
    column :transcript do |t|
      t.transcript.present? && t.transcript != 'null'
    end
    column :post do |t|
      link_to t.title, post_path(t)
    end
    column :difficulty
    column :seconds
    column :publish_date
    default_actions
  end

  controller do
    def permitted_params
      params.permit!
    end

    def find_resource
      @post = Post.find_by_permalink(params[:id]) || Post.find(params[:id])
    end
  end

  show do
    attributes_table do
      row :title do |t|
        link_to t.title, post_path(t)
      end
      row :guid
      row :description
      row :publish_date
      row :free
      row :difficulty
      row :seconds
      row :links
      row :thumbnail_image
      row :wistia_embed
      row :code
      row :transcript
    end
  end

  form do |f|
    f.inputs "post" do
      f.input :title
      f.input :free
      f.input :guid
      f.input :seconds
      f.input :difficulty, :as => :select, :collection => ['basic', 'intermediate', 'advanced']
      f.input :publish_date
      f.input :wistia_embed
      f.input :thumbnail_image
      f.input :description
      f.input :links
      f.input :code
      f.input :transcript
    end
    f.actions
  end
end
