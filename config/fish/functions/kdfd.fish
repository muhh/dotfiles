# Defined in - @ line 1
function kdfd --description 'alias kdfd=chef exec knife spork data bag from file dns'
	chef exec knife spork data bag from file dns $argv;
end
