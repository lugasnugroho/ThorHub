local UI = {}

function UI.Show(title, message)
    print("")
    print("╔════════════════════════════════╗")
    print("║          " .. title)
    print("╠════════════════════════════════╣")
    print("║ " .. message)
    print("╚════════════════════════════════╝")
    print("")
end

return UI
