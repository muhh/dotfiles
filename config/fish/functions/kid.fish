# Defined in - @ line 1
function kid --description 'alias kid=chef exec kitchen destroy'
	chef exec kitchen destroy $argv;
end
