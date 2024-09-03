function onEvent(n,v1,v2)
	if n == 'Make Background Cooler' and v1 == 'cool' then
		setProperty('stagefront.visible',false)
		setProperty('stageback.visible',false)
	end
	if n == 'Make Background Cooler' and v1 == 'not cool'then
		setProperty('stagefront.visible',true)
		setProperty('stageback.visible',true)
	end
end