local module = {
    array = {},
    table = {},
}


function module.table.print(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. module.table.print(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function module.array.contains (tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

return module
