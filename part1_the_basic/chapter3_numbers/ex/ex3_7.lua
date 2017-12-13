-- > Using math.random, write a function to produce a pseudo-random number with a standard normal (Gaussian) distribution.

-- - [ ] **TODO: the answer may be wrong**


function random_normal_distribution()
	math.randomseed(os.time())
	return math.random()
end

print(random_normal_distribution())