ActiveAdmin.register Post do
  permit_params :title, :publish_date, :video_url, :description, :transcript, :thumbnail_image, :links
  
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

  form do |f|
    f.inputs "post" do
      f.input :title
      f.input :publish_date
      f.input :video_url
      f.input :thumbnail_image
      f.input :tag_list, :hint => 'Comma separated'
      f.input :description
      f.input :links
      f.input :transcript
    end
    f.actions
  end  
end
