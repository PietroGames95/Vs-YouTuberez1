local offset = 20

function onCreate()
    makeLuaSprite('barTop', 'cinimatixxx', -9999,-9999)
    setObjectCamera('barTop', 'hud')
    setObjectOrder('barTop', 1)
    addLuaSprite('barTop')
    setProperty('barTop.flipX', true)
    
    makeLuaSprite('barBottom', 'cinimatixxx', -9999,-9999)
    setObjectCamera('barBottom', 'hud')
    setObjectOrder('barBottom', 1)
    addLuaSprite('barBottom')
end

function onEvent(n,v1,v2)
    if n == 'Cinimatic Bars' then
        offset = v2
        if v2 == '' or v2 == nil then
            offset = 0
        end

        if v1 == 'horizontal in' then
            setProperty('barTop.x',1280)
            setProperty('barTop.y',0 - offset)
            setProperty('barBottom.x',-1658)
            setProperty('barBottom.y',514 + offset)

            doTweenX('topIn', 'barTop', -378, (crochet/2000)*1.5, 'linear')
            doTweenX('bottomIn', 'barBottom', 0, (crochet/2000)*1.5, 'linear')
        elseif v1 == 'horizontal out' then
            setProperty('barTop.x',-378)
            setProperty('barTop.y',0 - offset)
            setProperty('barBottom.x',0)
            setProperty('barBottom.y',514 + offset)

            doTweenX('topOut', 'barTop', 1280, (crochet/2000)*1.5, 'linear')
            doTweenX('bottomOut', 'barBottom', -1658, (crochet/2000)*1.5, 'linear')
        elseif v1 == 'vertical in' then
            setProperty('barTop.x',-378)
            setProperty('barTop.y',-206)
            setProperty('barBottom.x',0)
            setProperty('barBottom.y',926)

            doTweenY('topIn', 'barTop', 0 - offset, (crochet/2000)*1.5, 'linear')
            doTweenY('bottomIn', 'barBottom',514  + offset, (crochet/2000)*1.5, 'linear')
        elseif v1 == 'vertical out' then
            setProperty('barTop.x',-378)
            setProperty('barTop.y',0  - offset)
            setProperty('barBottom.x',0)
            setProperty('barBottom.y',514 + offset)

            doTweenY('topOut', 'barTop', -206, (crochet/2000)*1.5, 'linear')
            doTweenY('bottomOut', 'barBottom', 926, (crochet/2000)*1.5, 'linear')
        elseif v1 == 'update' then
            doTweenY('topIn', 'barTop', 0 - offset, (crochet/2000)*1.5, 'linear')
            doTweenY('bottomIn', 'barBottom',514  + offset, (crochet/2000)*1.5, 'linear')
        end
    end
end