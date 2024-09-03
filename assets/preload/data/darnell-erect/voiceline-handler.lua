function onCreate()
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'pico-dead')
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pico')
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver-pico')
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd-pico')
	--setPropertyFromClass('substates.PauseSubState', 'songName', 'breakfast-pico/breakfast-pico')
	
	makeAnimatedLuaSprite('pico_voiceline', 'characters/specialAnims/Pico_Get_This_Started', getProperty('boyfriend.x') - 102, getProperty('boyfriend.y'));
	addAnimationByPrefix('pico_voiceline', 'talk', 'Pico Get Started', 24, false);
	addLuaSprite('pico_voiceline', false);
	setProperty('pico_voiceline.visible', false)
end

function onStepHit()
	if curStep == 432 then
		setProperty('boyfriend.visible', false);
		setProperty('pico_voiceline.visible', true)
		playAnim('pico_voiceline', 'talk', false);

	end
	if curStep == 448 then
		setProperty('boyfriend.visible', true);
		setProperty('pico_voiceline.visible', false)
	end
end