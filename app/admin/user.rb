ActiveAdmin.register User do
  form do |f|
    f.inputs "Identity" do
      f.input :name
      f.input :email
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :name, :email, :admin
end
