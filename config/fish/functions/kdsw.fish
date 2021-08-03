function kdsw --wraps='knife' --description 'Pretty view websites data bag item'
  knife data bag show websites $argv --format json | jq .
end
