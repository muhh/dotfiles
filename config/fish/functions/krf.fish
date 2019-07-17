# Defined in - @ line 1
function krf --description 'alias krf=chef exec knife spork role from file'
	chef exec knife spork role from file $argv;
end
