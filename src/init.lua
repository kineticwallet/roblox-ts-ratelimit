--!nocheck
--!optimize 2

return function(Limit, Interval)
	assert(Limit > 0, "Limit must be greater than 0")

	local CountMap = {}
	local CountKeyless = 0

	return function(Key)
		if Key then
			local Count = CountMap[Key]

			if Count == nil then
				Count = 0

				task.delay(Interval, function()
					CountMap[Key] = nil
				end)
			end

			if Count == Limit then
				return false
			end

			CountMap[Key] = Count + 1
		else
			if CountKeyless == 0 then
				task.delay(Interval, function()
					CountKeyless = 0
				end)
			end

			if CountKeyless == Limit then
				return false
			end

			CountKeyless = CountKeyless + 1
		end

		return true
	end
end
