

class Constants

	N_BYTES = [42].pack('i').size
	N_BITS = N_BYTES * 8
	MAX_DISTANCE = 2 ** (N_BITS - 2) - 1

end
