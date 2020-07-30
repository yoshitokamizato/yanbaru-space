ActiveAdmin.register User do
  permit_params :nickname, :email, :password, :password_confirmation

  form do |f|
    f.inputs do
      f.input :nickname
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
