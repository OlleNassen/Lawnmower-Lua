﻿position = {x = 200, y = 50}
speed = 4
score = 0

function setPosition(x, y)
	position.x = x
	position.y = y
end

--mx = map x max, my = map y max

function collision(mx, my)
	if position.x > mx -16 then
        position.x = mx - 16
	elseif position.x < 16 then
        position.x = 16
    end
	
    if position.y > my -16 then
        position.y = my - 16
	elseif position.y < 16 then
        position.y = 16
	end

end

function move(delta, verticalDir, horizontalDir)

    if horizontalDir == 'left' then 
        position.x =  position.x - (delta * speed)
    elseif horizontalDir == 'right' then
        position.x = position.x + (delta * speed)
    end

    if verticalDir == 'up' then
        position.y = position.y - (delta * speed)
    elseif verticalDir == 'down' then
        position.y = position.y + (delta * speed)
    end

end

function getPosition()
    return position.x, position.y	
end


function collisionWithPlayer(playerPosx, playerPosy, playerSize)
	intersection = {x = 0, y = 0}

		if positionx > playerPosx + playerSize / 2 then
			intersection.x = (playerPosx + playerSize / 2) - (positionx - playerSize / 2)
		end

		if positionx > playerPosx + playerSize / 2 then	
			intersection.x = (positionx + playerSize / 2) - (playerPosx - playerSize / 2)
		end
		
		if positiony > playerPosy + playerSize / 2 then
			intersection.y = (playerPosy + playerSize / 2) - (positiony - playerSize / 2)
		end	

		if positiony < playerPosy - playerSize / 2 then
			intersection.y = (positiony + playerSize / 2) - (playerPosy - playerSize / 2)
		end	
	
		if intersection.x == 0 or intersection.y == 0 then
			position.x = position.x + intersection.x
			position.y = position.y + intersection.y
			return true, intersection.x, intersection.y
		else
			return false, intersection.x, intersection.y
		end
end


function collisionWithTile(tilePosx, tilePosy, tileSize, type)
	collide = false
	intersection = {x = 0, y = 0}

	if position.x > tilePosx + tileSize / 2 then
		intersection.x = (tilePosx + tileSize / 2) - (position.x - tileSize / 2)
	end

	if position.x > tilePosx + tileSize / 2 then	
		intersection.x = (position.x + tileSize / 2) - (tilePosx - tileSize / 2)
	end
		
	if position.y > tilePosy + tileSize / 2 then
		intersection.y = (tilePosy + tileSize / 2) - (position.y - tileSize / 2)
	end	

	if position.y < tilePosy - tileSize / 2 then
		intersection.y = (position.y + tileSize / 2) - (tilePosy - tileSize / 2)
	end	
	
	if intersection.x == 0 or intersection.y == 0 then
	--	position.x = position.x + intersection.x
	--	position.y = position.y + intersection.y
		return 2
	else
		return 3
	end
	return 4
end