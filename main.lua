local M = {}

function M:setup()
	function Status:perm()
		local h = self._current.hovered
		if not h then
			return ""
		end

		local perm = (h.stat and h.stat:perm()) or (h.cha and h.cha:perm())

		if not perm then
			return ""
		end

		local mode = (h.cha and h.cha.mode) or (h.stat and h.stat.mode)

		local spans = {}

		if mode then
			-- local octal = string.format("%04o", mode % 4096)
			local octal = string.format("%03o", mode % 512)
			spans[#spans + 1] = ui.Span(octal .. " ")
		end

		for i = 1, #perm do
			local c = perm:sub(i, i)
			local style = th.status.perm_type

			if c == "-" or c == "?" then
				style = th.status.perm_sep
			elseif c == "r" then
				style = th.status.perm_read
			elseif c == "w" then
				style = th.status.perm_write
			elseif c == "x" or c == "s" or c == "S" or c == "t" or c == "T" then
				style = th.status.perm_exec
			end

			spans[#spans + 1] = ui.Span(c):style(style)
		end

		return ui.Line(spans)
	end
end

return M
