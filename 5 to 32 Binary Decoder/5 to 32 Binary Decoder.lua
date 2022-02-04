Controls_In = (NamedControl.GetValue("In"))
Contrls_Out = (NamedControl.GetValue("Out"))

function add(In)

    local control_value = {}
    for i = 1, In do 
        table.insert(control_value, Controls.Inputs[i].Value) 
    end

    decimal = table.concat(control_value)
    decimal = (string.reverse(decimal))
    format(decimal)
end

function format(binary)

    tostring(binary)
    local remove = string.gsub(binary, "00", "0")
    remove = string.gsub(remove, "10", "1")
    remove = string.gsub(remove, "%.", "")
    remove = string.sub(remove, 2)
    decode(remove)
end

function decode(Out)

    local num = tonumber(Out,2) + 1
    NamedControl.SetText("Label #2", num)
    for i = 1, Contrls_Out do
        if num == i then
            Controls.Outputs[i].Value = 1
        else 
            Controls.Outputs[i].Value = 0
        end
    end
end

function TimerClick()

    Controls_In = (NamedControl.GetValue("In"))
    Contrls_Out = (NamedControl.GetValue("Out"))

    if Controls_In ~= nil and Controls_In ~= 0 then
        add(Controls_In)
    end
end

MyTimer = Timer.New()
MyTimer.EventHandler = TimerClick
MyTimer:Start(.5)