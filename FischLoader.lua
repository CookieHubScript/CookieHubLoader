local function loadScript(url)
    -- ใช้ HttpGet เพื่อดึงโค้ดจาก URL
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)

    -- ตรวจสอบว่าดึงข้อมูลสำเร็จหรือไม่
    if success then
        local scriptFunction, errorMessage = loadstring(response) -- แปลงโค้ดเป็นฟังก์ชัน
        if scriptFunction then
            scriptFunction() -- รันโค้ด
        else
            warn("Failed to load script: " .. (errorMessage or "Unknown error")) -- แสดงข้อผิดพลาด
        end
    else
        warn("Failed to fetch script: " .. (response or "Unknown error")) -- แสดงข้อผิดพลาดหากดึงข้อมูลไม่สำเร็จ
    end
end

-- URL ของสคริปต์บน GitHub
local githubScriptUrl = "https://raw.githubusercontent.com/Nakhun12310/CookieHub/refs/heads/main/Fisch.lua"

-- โหลดและรันสคริปต์
loadScript(githubScriptUrl)
