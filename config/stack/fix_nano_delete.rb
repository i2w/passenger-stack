package :fix_nano_delete do
  description 'Make it that nano\'s delete key is not bound to backspace key (unless on Darwin)'
  
  push_text 'echo "set rebinddelete"', "/etc/nanorc", :sudo => true
  
  verify do
    @commands << %q(test `uname` = "Darwin" || grep 'echo "set rebinddelete"' /etc/nanorc)
  end
end
