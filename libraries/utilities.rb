def recursive_has_key?(keys, hash)
  key = keys.shift
  if(!hash.has_key?(key))
    return false
  end
  if(keys.length > 0)
    return recursive_has_key?(keys, hash[key])
  end
  return true
end