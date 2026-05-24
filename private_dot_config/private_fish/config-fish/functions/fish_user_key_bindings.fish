function fish_user_key_bindings

  #default keybind
  for mode in insert default visual
    fish_default_key_bindings -M $mode
  end
  fish_vi_key_bindings --no-erase

  #peco hisotry
  bind \cw peco_select_history

end
