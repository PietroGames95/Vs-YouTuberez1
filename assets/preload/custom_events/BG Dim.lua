-- script by skellix

function onCreatePost()
    makeLuaSprite('dimmer', '', -9999, -9999)
    makeGraphic('dimmer', 19998, 19998, '000031')
	addLuaSprite('dimmer', true)
    setObjectOrder('dimmer', getObjectOrder('gfGroup')-1)
    setProperty('dimmer.alpha', 0)
    setBlendMode('dimmer', 'multiply')
end

function onEvent(n,v1,v2)
    if n == 'BG Dim' then
        duration = 0.0001
        if v1 == '' or v1 == nil then
            duration = v2
        end

        if v1 == '' or v1 == nil then
            doTweenAlpha('dimmer-fadeIN', 'dimmer', 0.5, duration, 'linear')
        else
            doTweenAlpha('dimmer-fadeOUT', 'dimmer', 0, duration, 'linear')
        end
    end
end