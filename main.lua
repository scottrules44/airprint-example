local airprint = require("plugin.airprint")
local json = require("json")
local widget = require("widget")
--create a new file
local newPath = system.pathForFile( "myfile.txt", system.TemporaryDirectory )
local newFile = io.open( newPath, "w" )
newFile:write( "hello world" )
io.close( newFile )
newFile = nil
--layout
local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( .5 )
local icon = display.newImage( "Airprint.png", display.contentCenterX, 50 )
icon:scale( .5, .5 )
local title = display.newText( "Airprint", icon.x, icon.y+(icon.height*.5*.5), native.systemFont, 30 )

local printButton1
printButton1 = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY+50,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        id = "createdFile",
        label = "Print created file",
        onEvent = function ( e )
                if (e.phase == "ended") then
                      airprint.print(system.pathForFile( "myDoc.pdf" ))
                end
        end
} )

local printButton2
printButton2 = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        id = "pdf",
        label = "Print PDF",
        onEvent = function ( e )
                if (e.phase == "ended") then
                      airprint.print(system.pathForFile( "myfile.txt", system.TemporaryDirectory ))
                end
        end
} )
local printButton3
printButton3 = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY-50,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        id = "png",
        label = "Print Image",
        onEvent = function ( e )
                if (e.phase == "ended") then
                      airprint.print(system.pathForFile( "corona.png" ))
                end
        end
} )