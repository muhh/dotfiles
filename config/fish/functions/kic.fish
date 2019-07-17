# Defined in - @ line 1
function kic --description 'alias kic=chef exec kitchen converge'
	chef exec kitchen converge $argv;
end
