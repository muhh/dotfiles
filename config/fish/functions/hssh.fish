function hssh --wraps='hcloud' --description 'SSH into one of freistils hetzner cloud instances'
  hcloud server ssh $argv -i ~/.ssh/freistil-terraform_root -o StrictHostKeyChecking=no
end
