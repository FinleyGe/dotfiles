function svim --wraps='sudo --preserve-env nvim' --description 'alias svim=sudo --preserve-env nvim'
  sudo --preserve-env nvim $argv
        
end
