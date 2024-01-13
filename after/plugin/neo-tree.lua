require("neo-tree").setup({
	window = {
		width = 30,
	},
    filesystem = {
        follow_current_file = {
            enabled = true,
        },
        filtered_items = {
            hide_by_pattern = {
                "**/*.bs.js"
            }
        }
    }
})
