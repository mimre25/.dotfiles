 require('code-link').setup(
 {
 copy_command = function(link)
		return 'echo "' .. link .. '" | xclip -selection clipboard -in &> /dev/null'
	end,

})
