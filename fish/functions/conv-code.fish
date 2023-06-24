function conv-code
  iconv -f cp936 -t utf-8 $argv[1] -o $argv[1]
end
