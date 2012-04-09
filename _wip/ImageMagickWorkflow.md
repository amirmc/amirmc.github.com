ImageMagick Workflow

convert dragon.gif    -resize 40x40^>  fill_dragon.gif

-gravity center -extent 64x64  fill_crop_dragon.gif


# To scale the original image
convert input-1.gif  -resize 940x1500^>  image-1.gif

# To produce the thumbnail
convert input-1.gif  -resize 40x40^> -gravity center -extent 40x40  image-thumb-1.gif