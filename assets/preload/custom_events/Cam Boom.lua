function onEvent(n,v1,v2)
    if n == 'Cam Boom' then
        default = getProperty('defaultCamZoom')
        intensity = v1
        if v1 == '' or v1 == nil then
           intensity = 1.15 
        end
        doTweenZoom('boom','camGame',default * intensity ,0.0001,'linear')
    end
end

function onTweenCompleted(n)
    if n == 'boom' then
        doTweenZoom('unboom','camGame',default, (crochet/2000)*1.5,'sineInOut')
    end
end