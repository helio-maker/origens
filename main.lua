local Orion = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local function tween(obj, props, duration, style, direction)
    return TweenService:Create(obj, TweenInfo.new(duration or 0.3, style or Enum.EasingStyle.Quint, direction or Enum.EasingDirection.Out), props)
end

function Orion:CreateOrion(orionName)
    orionName = orionName or "Orion"
    local isClosed = false
    
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local MainGradient = Instance.new("UIGradient")
    local MainCorner = Instance.new("UICorner")
    local MainStroke = Instance.new("UIStroke")
    local ContentFrame = Instance.new("Frame")
    local ContentCorner = Instance.new("UICorner")
    local TabFrame = Instance.new("Frame")
    local TabList = Instance.new("UIListLayout")
    local TabPadding = Instance.new("UIPadding")
    local Header = Instance.new("Frame")
    local HeaderGradient = Instance.new("UIGradient")
    local HeaderCorner = Instance.new("UICorner")
    local LibTitle = Instance.new("TextLabel")
    local CloseBtn = Instance.new("ImageButton")
    local ElementContainer = Instance.new("ScrollingFrame")
    local ContainerCorner = Instance.new("UICorner")
    local PagesFolder = Instance.new("Folder")

    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -280, 0.5, -180)
    MainFrame.Size = UDim2.new(0, 560, 0, 360)
    MainFrame.ClipsDescendants = true

    MainGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 25))
    }
    MainGradient.Rotation = 45
    MainGradient.Parent = MainFrame

    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame

    MainStroke.Color = Color3.fromRGB(100, 100, 130)
    MainStroke.Transparency = 0.7
    MainStroke.Thickness = 1
    MainStroke.Parent = MainFrame

    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    ContentFrame.BackgroundTransparency = 0.3
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Position = UDim2.new(0, 6, 0, 6)
    ContentFrame.Size = UDim2.new(1, -12, 1, -12)

    ContentCorner.CornerRadius = UDim.new(0, 10)
    ContentCorner.Parent = ContentFrame

    TabFrame.Name = "TabFrame"
    TabFrame.Parent = ContentFrame
    TabFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    TabFrame.BackgroundTransparency = 0.2
    TabFrame.BorderSizePixel = 0
    TabFrame.Size = UDim2.new(0, 130, 1, 0)

    TabList.Name = "TabList"
    TabList.Parent = TabFrame
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 4)

    TabPadding.Parent = TabFrame
    TabPadding.PaddingLeft = UDim.new(0, 8)
    TabPadding.PaddingRight = UDim.new(0, 8)
    TabPadding.PaddingTop = UDim.new(0, 70)

    Header.Name = "Header"
    Header.Parent = ContentFrame
    Header.BackgroundColor3 = Color3.fromRGB(120, 60, 255)
    Header.BackgroundTransparency = 0.3
    Header.BorderSizePixel = 0
    Header.Position = UDim2.new(0, 138, 0, 8)
    Header.Size = UDim2.new(1, -146, 0, 50)

    HeaderGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 60, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 100, 255))
    }
    HeaderGradient.Parent = Header

    HeaderCorner.CornerRadius = UDim.new(0, 8)
    HeaderCorner.Parent = Header

    LibTitle.Name = "LibTitle"
    LibTitle.Parent = Header
    LibTitle.BackgroundTransparency = 1
    LibTitle.Position = UDim2.new(0, 16, 0, 0)
    LibTitle.Size = UDim2.new(1, -50, 1, 0)
    LibTitle.Font = Enum.Font.GothamBold
    LibTitle.Text = orionName
    LibTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    LibTitle.TextSize = 20
    LibTitle.TextXAlignment = Enum.TextXAlignment.Left

    CloseBtn.Name = "CloseBtn"
    CloseBtn.Parent = Header
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Position = UDim2.new(1, -40, 0.5, -15)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Image = "rbxassetid://4988112250"
    CloseBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.MouseButton1Click:Connect(function()
        isClosed = not isClosed
        if isClosed then
            CloseBtn.Image = "rbxassetid://5165666242"
            tween(CloseBtn, {Rotation = 180}, 0.3):Play()
            tween(MainFrame, {Size = UDim2.new(0, 450, 0, 66)}, 0.3):Play()
            tween(ContentFrame, {BackgroundTransparency = 1}, 0.3):Play()
        else
            CloseBtn.Image = "rbxassetid://4988112250"
            tween(CloseBtn, {Rotation = 0}, 0.3):Play()
            tween(MainFrame, {Size = UDim2.new(0, 560, 0, 360)}, 0.3):Play()
            tween(ContentFrame, {BackgroundTransparency = 0.3}, 0.3):Play()
        end
    end)

    ElementContainer.Name = "ElementContainer"
    ElementContainer.Parent = ContentFrame
    ElementContainer.BackgroundTransparency = 1
    ElementContainer.BorderSizePixel = 0
    ElementContainer.Position = UDim2.new(0, 138, 0, 66)
    ElementContainer.Size = UDim2.new(1, -146, 1, -74)
    ElementContainer.ScrollBarThickness = 4
    ElementContainer.ScrollBarImageColor3 = Color3.fromRGB(120, 60, 255)
    ElementContainer.CanvasSize = UDim2.new(0, 0, 0, 0)

    ContainerCorner.CornerRadius = UDim.new(0, 8)
    ContainerCorner.Parent = ElementContainer

    PagesFolder.Parent = ElementContainer

    local Camera = workspace.CurrentCamera
    local DragPos, FramePos, Dragging

    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragPos = Vector2.new(input.Position.X, input.Position.Y)
            FramePos = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = (Vector2.new(input.Position.X, input.Position.Y) - DragPos) / Camera.ViewportSize
            MainFrame.Position = UDim2.new(FramePos.X.Scale + delta.X, FramePos.X.Offset, FramePos.Y.Scale + delta.Y, FramePos.Y.Offset)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = false
        end
    end)

    local SectionHandler = {}

    function SectionHandler:CreateSection(secName)
        secName = secName or "Tab"

        local TabBtn = Instance.new("TextButton")
        local TabCorner = Instance.new("UICorner")
        local TabGradient = Instance.new("UIGradient")

        TabBtn.Name = "TabBtn" .. secName
        TabBtn.Parent = TabFrame
        TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        TabBtn.BackgroundTransparency = 0.5
        TabBtn.BorderSizePixel = 0
        TabBtn.Size = UDim2.new(1, 0, 0, 38)
        TabBtn.Font = Enum.Font.GothamSemibold
        TabBtn.Text = secName
        TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabBtn.TextSize = 14
        TabBtn.AutoButtonColor = false

        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Parent = TabBtn

        TabGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
        }
        TabGradient.Rotation = 90
        TabGradient.Enabled = false
        TabGradient.Parent = TabBtn

        local NewPage = Instance.new("ScrollingFrame")
        local PageList = Instance.new("UIListLayout")
        local PagePadding = Instance.new("UIPadding")

        NewPage.Name = "Page" .. secName
        NewPage.Parent = PagesFolder
        NewPage.BackgroundTransparency = 1
        NewPage.BorderSizePixel = 0
        NewPage.Size = UDim2.new(1, 0, 1, 0)
        NewPage.ScrollBarThickness = 4
        NewPage.ScrollBarImageColor3 = Color3.fromRGB(120, 60, 255)
        NewPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        NewPage.Visible = false

        PageList.Parent = NewPage
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 6)

        PagePadding.Parent = NewPage
        PagePadding.PaddingTop = UDim.new(0, 8)
        PagePadding.PaddingLeft = UDim.new(0, 8)
        PagePadding.PaddingRight = UDim.new(0, 8)

        local function UpdateCanvas()
            local size = PageList.AbsoluteContentSize
            NewPage.CanvasSize = UDim2.new(0, 0, 0, size.Y + 16)
        end

        NewPage.ChildAdded:Connect(UpdateCanvas)
        NewPage.ChildRemoved:Connect(UpdateCanvas)

        TabBtn.MouseButton1Click:Connect(function()
            for _, page in pairs(PagesFolder:GetChildren()) do
                page.Visible = false
            end
            NewPage.Visible = true

            for _, btn in pairs(TabFrame:GetChildren()) do
                if btn:IsA("TextButton") then
                    tween(btn, {BackgroundTransparency = 0.5, TextColor3 = Color3.fromRGB(200, 200, 200)}, 0.2):Play()
                    local grad = btn:FindFirstChild("UIGradient")
                    if grad then grad.Enabled = false end
                end
            end

            TabGradient.Enabled = true
            tween(TabBtn, {BackgroundTransparency = 0.1, TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.2):Play()
        end)

        local ElementHandler = {}

        function ElementHandler:TextLabel(text)
            text = text or "Label"

            local Frame = Instance.new("Frame")
            local Corner = Instance.new("UICorner")
            local Label = Instance.new("TextLabel")

            Frame.Parent = NewPage
            Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            Frame.BackgroundTransparency = 0.3
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.new(1, -16, 0, 44)

            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = Frame

            Label.Parent = Frame
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, -16, 1, 0)
            Label.Position = UDim2.new(0, 8, 0, 0)
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left
        end

        function ElementHandler:TextButton(btnText, info, callback)
            btnText = btnText or "Button"
            info = info or ""
            callback = callback or function() end

            local Frame = Instance.new("Frame")
            local Corner = Instance.new("UICorner")
            local Btn = Instance.new("TextButton")
            local BtnCorner = Instance.new("UICorner")
            local BtnGradient = Instance.new("UIGradient")
            local Info = Instance.new("TextLabel")

            Frame.Parent = NewPage
            Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            Frame.BackgroundTransparency = 0.3
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.new(1, -16, 0, 44)

            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = Frame

            Btn.Parent = Frame
            Btn.BackgroundColor3 = Color3.fromRGB(120, 60, 255)
            Btn.BorderSizePixel = 0
            Btn.Position = UDim2.new(0, 8, 0.5, -14)
            Btn.Size = UDim2.new(0, 120, 0, 28)
            Btn.Font = Enum.Font.GothamSemibold
            Btn.Text = btnText
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Btn.TextSize = 13

            BtnCorner.CornerRadius = UDim.new(0, 6)
            BtnCorner.Parent = Btn

            BtnGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 60, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 100, 255))
            }
            BtnGradient.Parent = Btn

            Info.Parent = Frame
            Info.BackgroundTransparency = 1
            Info.Position = UDim2.new(0, 136, 0, 0)
            Info.Size = UDim2.new(1, -144, 1, 0)
            Info.Font = Enum.Font.Gotham
            Info.Text = info
            Info.TextColor3 = Color3.fromRGB(180, 180, 190)
            Info.TextSize = 13
            Info.TextXAlignment = Enum.TextXAlignment.Right

            Btn.MouseEnter:Connect(function()
                tween(Btn, {Size = UDim2.new(0, 125, 0, 30)}, 0.2):Play()
            end)

            Btn.MouseLeave:Connect(function()
                tween(Btn, {Size = UDim2.new(0, 120, 0, 28)}, 0.2):Play()
            end)

            Btn.MouseButton1Click:Connect(callback)
        end

        function ElementHandler:Toggle(info, callback)
            info = info or "Toggle"
            callback = callback or function() end

            local toggled = false

            local Frame = Instance.new("Frame")
            local Corner = Instance.new("UICorner")
            local Info = Instance.new("TextLabel")
            local ToggleOuter = Instance.new("Frame")
            local OuterCorner = Instance.new("UICorner")
            local ToggleInner = Instance.new("Frame")
            local InnerCorner = Instance.new("UICorner")
            local ToggleBtn = Instance.new("TextButton")

            Frame.Parent = NewPage
            Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            Frame.BackgroundTransparency = 0.3
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.new(1, -16, 0, 44)

            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = Frame

            Info.Parent = Frame
            Info.BackgroundTransparency = 1
            Info.Position = UDim2.new(0, 60, 0, 0)
            Info.Size = UDim2.new(1, -68, 1, 0)
            Info.Font = Enum.Font.GothamSemibold
            Info.Text = info
            Info.TextColor3 = Color3.fromRGB(255, 255, 255)
            Info.TextSize = 14
            Info.TextXAlignment = Enum.TextXAlignment.Left

            ToggleOuter.Parent = Frame
            ToggleOuter.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            ToggleOuter.BorderSizePixel = 0
            ToggleOuter.Position = UDim2.new(0, 8, 0.5, -12)
            ToggleOuter.Size = UDim2.new(0, 44, 0, 24)

            OuterCorner.CornerRadius = UDim.new(1, 0)
            OuterCorner.Parent = ToggleOuter

            ToggleInner.Parent = ToggleOuter
            ToggleInner.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            ToggleInner.BorderSizePixel = 0
            ToggleInner.Position = UDim2.new(0, 2, 0.5, -10)
            ToggleInner.Size = UDim2.new(0, 20, 0, 20)

            InnerCorner.CornerRadius = UDim.new(1, 0)
            InnerCorner.Parent = ToggleInner

            ToggleBtn.Parent = ToggleOuter
            ToggleBtn.BackgroundTransparency = 1
            ToggleBtn.Size = UDim2.new(1, 0, 1, 0)
            ToggleBtn.Text = ""

            ToggleBtn.MouseButton1Click:Connect(function()
                toggled = not toggled
                callback(toggled)
                if toggled then
                    tween(ToggleOuter, {BackgroundColor3 = Color3.fromRGB(120, 60, 255)}, 0.3):Play()
                    tween(ToggleInner, {Position = UDim2.new(0, 22, 0.5, -10), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.3):Play()
                else
                    tween(ToggleOuter, {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}, 0.3):Play()
                    tween(ToggleInner, {Position = UDim2.new(0, 2, 0.5, -10), BackgroundColor3 = Color3.fromRGB(60, 60, 70)}, 0.3):Play()
                end
            end)
        end

        function ElementHandler:Slider(info, min, max, callback)
            min = min or 0
            max = max or 100
            callback = callback or function() end

            local Frame = Instance.new("Frame")
            local Corner = Instance.new("UICorner")
            local Info = Instance.new("TextLabel")
            local Value = Instance.new("TextLabel")
            local SliderBtn = Instance.new("TextButton")
            local SliderCorner = Instance.new("UICorner")
            local Fill = Instance.new("Frame")
            local FillCorner = Instance.new("UICorner")

            Frame.Parent = NewPage
            Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            Frame.BackgroundTransparency = 0.3
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.new(1, -16, 0, 54)

            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = Frame

            Info.Parent = Frame
            Info.BackgroundTransparency = 1
            Info.Position = UDim2.new(0, 8, 0, 4)
            Info.Size = UDim2.new(1, -60, 0, 20)
            Info.Font = Enum.Font.GothamSemibold
            Info.Text = info
            Info.TextColor3 = Color3.fromRGB(255, 255, 255)
            Info.TextSize = 14
            Info.TextXAlignment = Enum.TextXAlignment.Left

            Value.Parent = Frame
            Value.BackgroundTransparency = 1
            Value.Position = UDim2.new(1, -52, 0, 4)
            Value.Size = UDim2.new(0, 44, 0, 20)
            Value.Font = Enum.Font.GothamBold
            Value.Text = min .. "/" .. max
            Value.TextColor3 = Color3.fromRGB(120, 60, 255)
            Value.TextSize = 13

            SliderBtn.Parent = Frame
            SliderBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            SliderBtn.BorderSizePixel = 0
            SliderBtn.Position = UDim2.new(0, 8, 1, -18)
            SliderBtn.Size = UDim2.new(1, -16, 0, 10)
            SliderBtn.AutoButtonColor = false
            SliderBtn.Text = ""

            SliderCorner.CornerRadius = UDim.new(1, 0)
            SliderCorner.Parent = SliderBtn

            Fill.Parent = SliderBtn
            Fill.BackgroundColor3 = Color3.fromRGB(120, 60, 255)
            Fill.BorderSizePixel = 0
            Fill.Size = UDim2.new(0, 0, 1, 0)

            FillCorner.CornerRadius = UDim.new(1, 0)
            FillCorner.Parent = Fill

            local mouse = Players.LocalPlayer:GetMouse()
            local moving = false

            SliderBtn.MouseButton1Down:Connect(function()
                moving = true
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    moving = false
                end
            end)

            local function update()
                local sizeX = math.clamp((mouse.X - SliderBtn.AbsolutePosition.X) / SliderBtn.AbsoluteSize.X, 0, 1)
                local val = math.floor(min + (max - min) * sizeX)
                Value.Text = val .. "/" .. max
                tween(Fill, {Size = UDim2.new(sizeX, 0, 1, 0)}, 0.1):Play()
                callback(val)
            end

            SliderBtn.MouseButton1Down:Connect(update)
            mouse.Move:Connect(function()
                if moving then update() end
            end)
        end

        function ElementHandler:KeyBind(info, key, callback)
            key = key or Enum.KeyCode.E
            callback = callback or function() end

            local currentKey = key.Name

            local Frame = Instance.new("Frame")
            local Corner = Instance.new("UICorner")
            local Info = Instance.new("TextLabel")
            local Btn = Instance.new("TextButton")
            local BtnCorner = Instance.new("UICorner")

            Frame.Parent = NewPage
            Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            Frame.BackgroundTransparency = 0.3
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.new(1, -16, 0, 44)

            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = Frame

            Info.Parent = Frame
            Info.BackgroundTransparency = 1
            Info.Position = UDim2.new(0, 100, 0, 0)
            Info.Size = UDim2.new(1, -108, 1, 0)
            Info.Font = Enum.Font.Gotham
            Info.Text = info
            Info.TextColor3 = Color3.fromRGB(180, 180, 190)
            Info.TextSize = 13
            Info.TextXAlignment = Enum.TextXAlignment.Right

            Btn.Parent = Frame
            Btn.BackgroundColor3 = Color3.fromRGB(120, 60, 255)
            Btn.BorderSizePixel = 0
            Btn.Position = UDim2.new(0, 8, 0.5, -14)
            Btn.Size = UDim2.new(0, 84, 0, 28)
            Btn.Font = Enum.Font.GothamBold
            Btn.Text = currentKey
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Btn.TextSize = 12

            BtnCorner.CornerRadius = UDim.new(0, 6)
            BtnCorner.Parent = Btn

            Btn.MouseButton1Click:Connect(function()
                Btn.Text = "..."
                local input = UserInputService.InputBegan:Wait()
                if input.KeyCode.Name ~= "Unknown" then
                    currentKey = input.KeyCode.Name
                    Btn.Text = currentKey
                end
            end)

            UserInputService.InputBegan:Connect(function(input, gpe)
                if not gpe and input.KeyCode.Name == currentKey then
                    callback()
                end
            end)
        end

        function ElementHandler:TextBox(info, placeholder, callback)
            info = info or ""
            placeholder = placeholder or "Enter text..."
            callback = callback or function() end

            local Frame = Instance.new("Frame")
            local Corner = Instance.new("UICorner")
            local Info = Instance.new("TextLabel")
            local BoxFrame = Instance.new("Frame")
            local BoxCorner = Instance.new("UICorner")
            local Box = Instance.new("TextBox")

            Frame.Parent = NewPage
            Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            Frame.BackgroundTransparency = 0.3
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.new(1, -16, 0, 44)

            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = Frame

            Info.Parent = Frame
            Info.BackgroundTransparency = 1
            Info.Position = UDim2.new(0, 160, 0, 0)
            Info.Size = UDim2.new(1, -168, 1, 0)
            Info.Font = Enum.Font.Gotham
            Info.Text = info
            Info.TextColor3 = Color3.fromRGB(180, 180, 190)
            Info.TextSize = 13
            Info.TextXAlignment = Enum.TextXAlignment.Right

            BoxFrame.Parent = Frame
            BoxFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            BoxFrame.BorderSizePixel = 0
            BoxFrame.Position = UDim2.new(0, 8, 0.5, -14)
            BoxFrame.Size = UDim2.new(0, 144, 0, 28)

            BoxCorner.CornerRadius = UDim.new(0, 6)
            BoxCorner.Parent = BoxFrame

            Box.Parent = BoxFrame
            Box.BackgroundTransparency = 1
            Box.Size = UDim2.new(1, -16, 1, 0)
            Box.Position = UDim2.new(0, 8, 0, 0)
            Box.Font = Enum.Font.Gotham
            Box.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
            Box.PlaceholderText = placeholder
            Box.Text = ""
            Box.TextColor3 = Color3.fromRGB(255, 255, 255)
            Box.TextSize = 13
            Box.ClearTextOnFocus = false

            Box.FocusLost:Connect(function(enter)
                if enter and Box.Text ~= "" then
                    callback(Box.Text)
                    Box.Text = ""
                end
            end)
        end

        function ElementHandler:Dropdown(info, options, callback)
            info = info or "Dropdown"
            options = options or {}
            callback = callback or function() end

            local opened = false
            local dropHeight = 44

            local Frame = Instance.new("Frame")
            local Corner = Instance.new("UICorner")
            local Header = Instance.new("TextButton")
            local HeaderCorner = Instance.new("UICorner")
            local Title = Instance.new("TextLabel")
            local Arrow = Instance.new("ImageLabel")
            local List = Instance.new("UIListLayout")

            Frame.Parent = NewPage
            Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            Frame.BackgroundTransparency = 0.3
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.new(1, -16, 0, 44)
            Frame.ClipsDescendants = true

            Corner.CornerRadius = UDim.new(0, 8)
            Corner.Parent = Frame

            Header.Parent = Frame
            Header.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            Header.BorderSizePixel = 0
            Header.Size = UDim2.new(1, 0, 0, 44)
            Header.AutoButtonColor = false
            Header.Text = ""

            HeaderCorner.CornerRadius = UDim.new(0, 8)
            HeaderCorner.Parent = Header

            Title.Parent = Header
            Title.BackgroundTransparency = 1
            Title.Position = UDim2.new(0, 12, 0, 0)
            Title.Size = UDim2.new(1, -44, 1, 0)
            Title.Font = Enum.Font.GothamSemibold
            Title.Text = info
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 14
            Title.TextXAlignment = Enum.TextXAlignment.Left

            Arrow.Parent = Header
            Arrow.BackgroundTransparency = 1
            Arrow.Position = UDim2.new(1, -32, 0.5, -10)
            Arrow.Size = UDim2.new(0, 20, 0, 20)
            Arrow.Image = "rbxassetid://5165666242"
            Arrow.ImageColor3 = Color3.fromRGB(120, 60, 255)

            List.Parent = Frame
            List.SortOrder = Enum.SortOrder.LayoutOrder
            List.Padding = UDim.new(0, 4)

            for _, opt in ipairs(options) do
                local Opt = Instance.new("TextButton")
                local OptCorner = Instance.new("UICorner")

                Opt.Parent = Frame
                Opt.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
                Opt.BorderSizePixel = 0
                Opt.Size = UDim2.new(1, -8, 0, 36)
                Opt.Font = Enum.Font.Gotham
                Opt.Text = "  " .. opt
                Opt.TextColor3 = Color3.fromRGB(220, 220, 230)
                Opt.TextSize = 13
                Opt.TextXAlignment = Enum.TextXAlignment.Left
                Opt.AutoButtonColor = false

                OptCorner.CornerRadius = UDim.new(0, 6)
                OptCorner.Parent = Opt

                dropHeight = dropHeight + 40

                Opt.MouseEnter:Connect(function()
                    tween(Opt, {BackgroundColor3 = Color3.fromRGB(120, 60, 255)}, 0.2):Play()
                end)

                Opt.MouseLeave:Connect(function()
                    tween(Opt, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}, 0.2):Play()
                end)

                Opt.MouseButton1Click:Connect(function()
                    callback(opt)
                    Title.Text = info .. ": " .. opt
                    tween(Frame, {Size = UDim2.new(1, -16, 0, 44)}, 0.3):Play()
                    tween(Arrow, {Rotation = 0}, 0.3):Play()
                    opened = false
                    task.wait(0.3)
                    UpdateCanvas()
                end)
            end

            Header.MouseButton1Click:Connect(function()
                opened = not opened
                if opened then
                    tween(Frame, {Size = UDim2.new(1, -16, 0, dropHeight)}, 0.3):Play()
                    tween(Arrow, {Rotation = 180}, 0.3):Play()
                else
                    tween(Frame, {Size = UDim2.new(1, -16, 0, 44)}, 0.3):Play()
                    tween(Arrow, {Rotation = 0}, 0.3):Play()
                end
                task.wait(0.3)
                UpdateCanvas()
            end)
        end

        return ElementHandler
    end

    return SectionHandler
end

return Orion