function onEvent(n,v1,v2)
    if n == 'Matt Arena Sparks' and getPropertyFromClass('states.PlayState', 'curStage') == 'arena' then

        if v1 == '' or v1 == nil then
            arenaSparks = true
        else
            arenaSparks = false            
            for i, j in pairs(particleArray) do
                if luaSpriteExists(particleArray[i].id) then
                    particleArray[i].lifeTime = 0
                    setProperty(particleArray[i].id..'.alpha', getProperty(particleArray[i].id..'.alpha') - (30 * elapse))
                    
                    if getProperty(particleArray[i].id..'.alpha') > 0 then
                        setProperty(particleArray[i].id..'.scale.x', particleArray[i].scale * getProperty(particleArray[i].id..'.alpha'))
                        setProperty(particleArray[i].id..'.scale.y', particleArray[i].scale * getProperty(particleArray[i].id..'.alpha'))
                    end
                    
                    --remove the particle
                    if getProperty(particleArray[i].id..'.alpha') <= 0 then
                        removeLuaSprite(particleArray[i].id, true)
                        particleArray[i] = nil
                    end
                end
            end

        end
    end
end

particleArray = {}
bfRawColorData = getProperty('boyfriend.healthColorArray')
gfRawColorData = getProperty('gf.healthColorArray')
dadRawColorData = getProperty('dad.healthColorArray')

function onStepHit()

    pick = math.random(1,3)

    if pick == 1 then 
        sparkColor = rgbToHex(bfRawColorData[1], bfRawColorData[2], bfRawColorData[3]) 
    elseif pick == 2 then
        sparkColor = rgbToHex(gfRawColorData[1], gfRawColorData[2], gfRawColorData[3])
    else
        sparkColor = rgbToHex(dadRawColorData[1], dadRawColorData[2], dadRawColorData[3])
    end
    if arenaSparks == true then
        for i = 1, math.random(1,3) do
            createNewSpark(sparkColor, -600 - math.random(100, -2500), 660)
        end
    end
end

function onBeatHit()
    for i, j in pairs(particleArray) do
        objectPlayAnimation(particleArray[i].id, 'bop', false)
    end
end

function onUpdate(e)
    elapse = e
    for i, j in pairs(particleArray) do
        if luaSpriteExists(particleArray[i].id) then
            particleArray[i].lifeTime = particleArray[i].lifeTime - e
            if particleArray[i].lifeTime <= 0 then
                particleArray[i].lifeTime = 0
                setProperty(particleArray[i].id..'.alpha', getProperty(particleArray[i].id..'.alpha') - (particleArray[i].decay * e))
                
                if getProperty(particleArray[i].id..'.alpha') > 0 then
                    setProperty(particleArray[i].id..'.scale.x', particleArray[i].scale * getProperty(particleArray[i].id..'.alpha'))
                    setProperty(particleArray[i].id..'.scale.y', particleArray[i].scale * getProperty(particleArray[i].id..'.alpha'))
                end
            end
            
            --remove the particle
            if getProperty(particleArray[i].id..'.alpha') <= 0 then
                removeLuaSprite(particleArray[i].id, true)
                particleArray[i] = nil
            end
        end
    end
end

function createNewSpark(color, x, y)
    local particle = 'spark'..(#particleArray + 1)
    local resize = math.random(0.5, 1)
	makeAnimatedLuaSprite(particle, 'mattArena/particle', x, y)
    addAnimationByPrefix(particle, 'bop', 'particle', 24, false)
	setProperty(particle..'.color', getColorFromHex(color))
    setProperty(particle..'.velocity.y', math.random(-25, -100))
    setProperty(particle..'.velocity.x', math.random(-25, 25))
    setProperty(particle..'.scale.x', resize)
    setProperty(particle..'.scale.y', resize)
	setProperty(particle..'.acceleration.x', getRandomFloat(-50, 50))
	setProperty(particle..'.acceleration.y', getRandomFloat(-500, 0))
    setBlendMode(particle, 'add')
	addLuaSprite(particle, true)
	setObjectOrder(particle, getObjectOrder('rail') + 1)
    particleArray[#particleArray + 1] = {id = particle, scale = 1, lifeTime = getRandomFloat(0.005, 0.05), decay = getRandomFloat(0.1, 0.4)}
end

function rgbToHex(r, g, b)
    red = r
    green =  g
    blue = b
    if r > 255 then red = 255 elseif r < 0 then red = 0 end
    if g > 255 then green = 255 elseif g < 0 then green = 0 end
    if b > 255 then blue = 255 elseif b < 0 then blue = 0 end
	return string.format('%02x%02x%02x', 
    math.floor(red),
    math.floor(green),
    math.floor(blue))
end