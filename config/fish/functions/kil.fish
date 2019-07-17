# Defined in - @ line 1
function kil --description 'alias kil=chef exec kitchen list'
	chef exec kitchen list $argv;
end
