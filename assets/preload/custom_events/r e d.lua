function onCreate()
    makeLuaSprite('red', '', -500, -200)
    makeGraphic('red', 3000, 2000, '0078cc')
	setBlendMode('red', 'subtract')
    setScrollFactor('red', 0.01, 0.01)
    setProperty('red.alpha', 0.65)
    addLuaSprite('red', true)
    setProperty('red.alpha',0)
end

function onEvent(n,v1,v2)
    if n == 'r e d' and v1 == 'yes' then
        setProperty('red.alpha',1)
    elseif n == 'r e d' and v1 == 'no' then
        setProperty('red.alpha',0)
    elseif n == 'r e d' and v1 == 'fade' then
        setProperty('red.alpha',1)
        doTweenAlpha('fadered', 'red', 0, (crochet/2000)*2.5,'sineInOut')
    end
end