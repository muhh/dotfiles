# Defined in - @ line 1
function kilo --wraps='kitchen login' --description 'alias kilo kitchen login'
  kitchen login $argv;
end
