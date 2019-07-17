# Defined in - @ line 1
function kiv --description 'alias kiv=chef exec kitchen verify'
	chef exec kitchen verify $argv;
end
