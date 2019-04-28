var color, number

for(var i=0; i<3; i++) {
    number[i] = irandom_range(0,255)
}

color = make_color_rgb(number[0],number[1],number[2])

image_blend = color