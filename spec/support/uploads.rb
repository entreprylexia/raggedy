 
def test_image_path
	Rails.root.join('spec/images/example.jpeg')
end 

def example_image
	test_image_path.open
end 