class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    auth_hash = request.env["omniauth.auth"]
    uid = auth.hash['uid']
    name = auth.hash['info']['name']
    auth = Authorization.find_by_provider_and_uid("twitter", uid)

    if auth
      # We know abou this user who is signing in with the provider:
      # just return the User associated with the Authorization
      user = auth.user
    else
      # is a user signed in already? If not then find or create the user
      unless current_user
        unless user = User.find_by_name(name)
          user = User.create({
            name: name,
            password: Devise.friendly_token[0,8],
            email: "#{UUIDTools::UUID.random_create}@rota.com"
            })
          end
        else
          user = current_user
        end
        # create an authorization for the current user
        unless auth = user.authorization.find_by_provider("twitter")
          auth = user.authorizations.build(provider: "twitter", uid: uid)
          user.authorizations << auth
        end
        auth.update_attributes({
          uid: uid,
          token: auth_hash['credentials']['token'],
          secret: auth_hash['credentials']['secret'],
          name: name,
          url: "http://twitter.com/#{name}"
          })
    end
    if user
      sign_in_and_redirect user, event: :authentication
    else
      rediect_to :new_user_registration
    end
  end
end
