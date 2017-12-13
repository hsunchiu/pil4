-- > Write a function to compute the volume of a right circular cone, given its height and the angle between a generatrix and the axis.

function volume_of_right_circular_cone( height, angle )
	return 1/3.0 * math.pi * (math.tan(angle * math.pi / 180))^2 * height
end


-- test case
print(volume_of_right_circular_cone(1,45))
print(math.pi/3)