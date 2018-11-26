json.data do
  json.user do
    json.call(
      @user,
      :email,
      :authentication_token,
      :id
    )
  end
end
