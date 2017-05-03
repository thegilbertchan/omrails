ActiveAdmin.register User do
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
	
	permit_params :email, :admin, :name, :username

	form do |f|
		f.semantic_errors
		f.inputs do
			f.input :email
			f.input :admin
			f.input :name
	  		f.input :username
		end
		f.actions
	end

	index do
	  id_column
	  column :email
	  column :admin
	  column :name
	  column :username
	  actions
	end

end
