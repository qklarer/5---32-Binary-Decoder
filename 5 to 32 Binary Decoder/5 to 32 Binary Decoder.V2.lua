Controls_In = 5
Contrls_Out = 32

local function tobinary(number)
    local str = ""
    if number == 0 then
        return 0
    elseif number < 0 then
        number = - number
        str = "-"
    end
    local power = 0
    while true do
        if 2^power > number then break end
        power = power + 1
    end
    local dot = true
    while true do
        power = power - 1
        if dot and power < 0 then
            str = str .. "."
            dot = false
        end
        if 2^power <= number then
            number = number - 2^power
            str = str .. "1"
        else
            str = str .. "0"
        end
        if number == 0 and power < 1 then break end
    end
    return str
end
  
function add(In)
    pin[1] = Controls.Inputs[1].Value

    print("yo")

    local value = 0
    local control_value = {}
    local On_control_value = {}
    for i = 1, In do 
        table.insert(control_value, Controls.Inputs[i].Value) 
    end

    for k,v in pairs(control_value) do
        -- print(k)
        -- print(v)
        if v == 1 then 
            print(k)
            --table.insert(On_control_value,k)
        end
    end
    
    -- for k,v in ipairs(On_control_value) do
    --     print(k)
    -- end

   -- return(value)          
end

function decode(Out)

    for i = 1, Contrls_Out do
        --print(i)
        --print(Out)
        if Out == (i) then
            Controls.Outputs[i+1].Value = 1
        else Controls.Outputs[i].Value = 0
        end
    end
end

Controls.Inputs[1].EventHandler = add(Controls_In)
--Controls.Inputs[2].EventHandler = add(Controls_In)