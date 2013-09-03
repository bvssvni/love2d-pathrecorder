love2d-pathrecorder
===================

Records mouse movements and sends path to callback when releasing mouse button.

BSD license.  
by Sven Nilsen, 2012  
http://www.cutoutpro.com  

Version: 0.000 in [angular degrees version notation](http://isprogrammingeasy.blogspot.no/2012/08/angular-degrees-versioning-notation.html)  

#Example

    local PathRecorder = require "pathrecorder"

    -- In this example we won't process paths, so we set no callback.
    local pathrecorder = PathRecorder(nil)

    -- The path recorder detects if the mouse button is pressed.
    function love.update()
      pathrecorder.Update()
    end

    -- Draw the temporary path currently recording.
    function love.draw()
      pathrecorder.Draw()
    end


See [pathrecorder.lua](https://github.com/bvssvni/love2d-pathrecorder/blob/master/pathrecorder.lua) for more information.
