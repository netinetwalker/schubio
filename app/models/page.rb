class Page < ActiveRecord::Base
  def http_auth_users_hash
    if self.http_auth_users
      users = {}
      self.http_auth_users.split(/\r?\n|\r/).each do |userline|
        splitted = userline.split ':'
        users[splitted[0]] = splitted[1]
      end
      return users
    else
      return false
    end
  end
end
