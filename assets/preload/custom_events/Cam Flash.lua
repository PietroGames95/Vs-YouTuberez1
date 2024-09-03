function onCreate()
    makeLuaSprite('tity', '', 0,0)
    makeGraphic('tity', 1280, 720, 'ffffff')
    setObjectCamera('tity', 'hud')
    setObjectOrder('tity', 0)
    setProperty('tity.alpha', 0)
    addLuaSprite('tity')
end

function onEvent(n,v1,v2)
    if n == 'Cam Flash' then
        multi = v1
        if v1 == '' or v1 == nil then
            multi = 1
        end
        setProperty('tity.alpha', 1)
        doTweenAlpha('flash', 'tity', 0, (crochet/2000)*multi,'sineInOut')
    end
end