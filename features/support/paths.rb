def path_to(page_name)
	case page_name

	when /the sign up page/
		'/users/sign_up'

	when /the sign in page/
		'/users/sign_in'
	end
end  