# Defined in - @ line 1
function gpt --wraps='git push --tags' --description 'alias gpt=git push --tags'
  git push --tags $argv;
end
