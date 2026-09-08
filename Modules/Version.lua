local Version = {}

function Version.Check(CurrentVersion, LatestVersion)

    print("")
    print("🔄 Checking ThorHub version...")
    print("--------------------------------")

    print("Current :", CurrentVersion)
    print("Latest  :", LatestVersion)

    if CurrentVersion == LatestVersion then

        print("✅ ThorHub sudah menggunakan versi terbaru.")

        return {
            Updated = true,
            Message = "You are using the latest version."
        }

    else

        print("⚠️ Update tersedia!")

        return {
            Updated = false,
            Message = "A newer version is available."
        }

    end
end

return Version
