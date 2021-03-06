### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ 2a2d6d20-2bbc-11eb-31dd-fdb4e63ae2c6
begin
	using Images
	sample = load("sample.jpg")
end

# ╔═╡ 951b2abc-2c22-11eb-12d0-2da8f728c21e
md""" # Working with Images"""

# ╔═╡ 2efd8ad8-2ba3-11eb-0c30-ab32b79fa157
url = "https://i.imgur.com/VGPeJ6s.jpg"

# ╔═╡ 6f4d2e6a-2bba-11eb-1f45-9b4d6b4eeb6d
download(url, "sample.jpg") 

# ╔═╡ 7ebc4bc2-2bbc-11eb-1762-2f888382f6cd
sample

# ╔═╡ abe5eb36-2c1f-11eb-3b2b-d941e71f7b46
typeof(sample)

# ╔═╡ e8a5d966-2c22-11eb-014b-6b41669be482
RGBX(0.6, 0.4, 0.1)

# ╔═╡ e8598444-2c22-11eb-3de6-313ca386794d
RGBX(0.5, 0.6, 0.1)

# ╔═╡ 403ee728-2c24-11eb-31a9-158512ed818f
size(sample)

# ╔═╡ 402016c4-2c24-11eb-1181-f3d2bcbc0830
sample[100,400]

# ╔═╡ 4000c1de-2c24-11eb-32fc-618e1c4ed8dc
typeof(sample[100,2000])

# ╔═╡ 1f246908-2c26-11eb-2b1a-f7156e7e9eca
sample[1:1000, 1:400]

# ╔═╡ 31cd3ed8-2c26-11eb-134a-6da9c52ec0e3
begin
	(h, w) = size(sample)
	head = sample[(h ÷ 2):h, (w ÷ 15) : (9w ÷ 10)]
end

# ╔═╡ 31b01088-2c26-11eb-1be8-45b998ce8abf
size(head)

# ╔═╡ 7e298212-2c28-11eb-1937-6da236e006c4
size(sample)1

# ╔═╡ 0cb10d72-2c54-11eb-271d-65fb7a901d99
[head head]	

# ╔═╡ 0c929338-2c54-11eb-0a80-8f2a60126f7c
size([head head]	)

# ╔═╡ 4683763a-2c55-11eb-104e-19208524d241
[
	head_of_image 								reverse(head, dims=2)
	reverse(head, dims=1)				reverse(reverse(head, dims=1), dims=2)
]

# ╔═╡ 4663200c-2c55-11eb-2e3c-f192353ec5ee
new_image = copy(head)

# ╔═╡ f468b144-2c57-11eb-00e8-493b369df3d5
red = RGB(1,0,0)

# ╔═╡ f44d49c4-2c57-11eb-3040-718f4eb1c84b
for i in 1:600
	for j in 1:800
		new_image[i, j] = red
	end
end

# ╔═╡ f028a2e0-2c63-11eb-0de3-75711d8ea77e
begin
	new_image1 = copy(new_image)
	new_image1[100:400, 1:100] .= RGB(0,1,0)
	new_image1
end

# ╔═╡ 6f742772-2c64-11eb-13cb-893268548e75
function redify(color)
	return RGB(color.r,0,0)
end

# ╔═╡ 6f500f2c-2c64-11eb-2afc-ddf7a0382753
begin
	color = RGB(0.8, 0.6, 0.7)
	
	[color, redify(color)]
end

# ╔═╡ 6f3041ec-2c64-11eb-298d-3531b0dc6723
[head redify.(head)]

# ╔═╡ 6431ba06-2c6f-11eb-1ae5-f7137ae8d7ca
function decimate(arr, ratio=5) 
               return arr[1:ratio:end, 1:ratio:end]
end

# ╔═╡ 6f0ded10-2c64-11eb-3282-634c28e64d92
begin
	poor_doggo = decimate(new_image, 10)
	poor_doggo
end

# ╔═╡ Cell order:
# ╟─951b2abc-2c22-11eb-12d0-2da8f728c21e
# ╠═2efd8ad8-2ba3-11eb-0c30-ab32b79fa157
# ╠═6f4d2e6a-2bba-11eb-1f45-9b4d6b4eeb6d
# ╠═2a2d6d20-2bbc-11eb-31dd-fdb4e63ae2c6
# ╠═7ebc4bc2-2bbc-11eb-1762-2f888382f6cd
# ╠═abe5eb36-2c1f-11eb-3b2b-d941e71f7b46
# ╠═e8a5d966-2c22-11eb-014b-6b41669be482
# ╠═e8598444-2c22-11eb-3de6-313ca386794d
# ╠═403ee728-2c24-11eb-31a9-158512ed818f
# ╠═402016c4-2c24-11eb-1181-f3d2bcbc0830
# ╠═4000c1de-2c24-11eb-32fc-618e1c4ed8dc
# ╠═1f246908-2c26-11eb-2b1a-f7156e7e9eca
# ╠═31cd3ed8-2c26-11eb-134a-6da9c52ec0e3
# ╠═31b01088-2c26-11eb-1be8-45b998ce8abf
# ╠═7e298212-2c28-11eb-1937-6da236e006c4
# ╠═0cb10d72-2c54-11eb-271d-65fb7a901d99
# ╠═0c929338-2c54-11eb-0a80-8f2a60126f7c
# ╠═4683763a-2c55-11eb-104e-19208524d241
# ╠═4663200c-2c55-11eb-2e3c-f192353ec5ee
# ╠═f468b144-2c57-11eb-00e8-493b369df3d5
# ╠═f44d49c4-2c57-11eb-3040-718f4eb1c84b
# ╠═f028a2e0-2c63-11eb-0de3-75711d8ea77e
# ╠═6f742772-2c64-11eb-13cb-893268548e75
# ╠═6f500f2c-2c64-11eb-2afc-ddf7a0382753
# ╠═6f3041ec-2c64-11eb-298d-3531b0dc6723
# ╠═6431ba06-2c6f-11eb-1ae5-f7137ae8d7ca
# ╠═6f0ded10-2c64-11eb-3282-634c28e64d92
