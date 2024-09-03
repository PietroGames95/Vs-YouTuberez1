--  script by skellix
function onEvent(n,v1,v2)
    if n == "Snap Cam Zoom" then
        doTweenZoom('snap','camGame', v1, 0.000000000000000000000000001,'sineInOut')
    end
end

function onTweenCompleted(n)
	if n == 'snap' then
			setProperty('defaultCamZoom', getProperty('camGame.zoom')) 
	end
end