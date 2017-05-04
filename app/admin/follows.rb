ActiveAdmin.register Follow do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :follower_type, :follower_id, :followable_type, :followable_id
	index do
	  id_column
	  column :follower_type
	  column :follower_id
	  column :followable_type
	  column :followable_id
	  actions
	end

end
