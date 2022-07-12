if callback then
    oldgravity = workspace.Gravity
    if entity.isAlive then
        workspace.Gravity = 0
        local enums = Enum.HumanoidStateType:GetEnumItems()
        table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
        for i,v in pairs(enums) do
            entity.character.Humanoid:SetStateEnabled(v, false)
        end
        entity.character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        RunLoops:BindToHeartbeat("Swim", 1, function()
            entity.character.HumanoidRootPart.Velocity = ((entity.character.Humanoid.MoveDirection ~= Vector3.new() or uis:IsKeyDown(Enum.KeyCode.Space)) and entity.character.HumanoidRootPart.Velocity or Vector3.new())
        end)
    end
else 
    workspace.Gravity = oldgravity
    RunLoops:UnbindFromHeartbeat("Swim")
    if entity.isAlive then
        local enums = Enum.HumanoidStateType:GetEnumItems()
        table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
        for i,v in pairs(enums) do
            entity.character.Humanoid:SetStateEnabled(v, true)
        end
    end
end
end
})
end)