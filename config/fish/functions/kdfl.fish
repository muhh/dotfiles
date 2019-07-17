# Defined in - @ line 1
function kdfl --description 'alias kdfl=chef exec knife spork data bag from file loadbalancer'
	chef exec knife spork data bag from file loadbalancer $argv;
end
