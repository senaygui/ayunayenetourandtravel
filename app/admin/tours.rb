ActiveAdmin.register Tour do
 permit_params :destination_id,:tour_title,:tour_duration,:itinerary,:other_essential_info,:map,:tour_avaliblity_status,:tour_display_on_homepage_priority,:tour_price_range, :desciption

  index do
    selectable_column
    column :tour_title
    column "destination", sortable: true do |c|
      c.destination.destination_name
    end 
    column :tour_duration
    column :tour_avaliblity_status
    column :tour_price_range
    column :created_at
    actions
  end
  filter :destination_id, as: :search_select_filter, url: proc { admin_destinations_path },
         fields: [:destination_name, :id], display_name: 'destination_name', minimum_input_length: 2,
         order_by: 'id_asc'
  filter :tour_title
  filter :tour_duration
  filter :tour_avaliblity_status
  filter :tour_display_on_homepage_priority
  filter :tour_price_range
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Tour Infromation" do
      f.input :tour_title
      f.input :destination_id, as: :search_select, url: admin_destinations_path,
          fields: [:destination_name, :id], display_name: 'destination_name', minimum_input_length: 2,
          order_by: 'id_asc'
      f.input :desciption
      f.input :tour_duration
      f.input :itinerary
      f.input :other_essential_info
      f.input :map
      f.input :tour_avaliblity_status
      f.input :tour_display_on_homepage_priority, as: :select, collection: ["Low", "Medium", "High"]
      f.input :tour_price_range
    end
    f.actions
  end

  show title: :tour_title do
    panel 'Tour Infromation' do
      attributes_table_for tour do
        row :tour_title
        row "destination", sortable: true do |c|
          c.destination.destination_name
        end 
        row :tour_duration
        row :desciption
        row :itinerary
        row :other_essential_info
        row :map
        row :tour_avaliblity_status
        row :tour_display_on_homepage_priority
        row :tour_price_range
        row :updated_at
        row :created_at
      end
    end
  end
  
end