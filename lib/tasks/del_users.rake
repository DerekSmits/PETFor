task :delete
  include Models::User:Sessions_controller
  @users.each do |user|
    if (Time.now - user.last_sign_in_at) / 86400 > 30
        user.delete 
  end
end
