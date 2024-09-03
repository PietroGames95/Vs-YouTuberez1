--[[
function onCreatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Darnell Can Gimmick' and getPropertyFromGroup('unspawnNotes', i, 'noteData') == 0 then
            setPropertyFromGroup('unspawnNotes', i, 'blockHit', true)
		end
	end
end
]]