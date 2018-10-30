class user::modify {
  user {'user_mod':
    name => $user::username,
    password => $user::password,    
  }
}
