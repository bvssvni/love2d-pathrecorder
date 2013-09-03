--[[

love2d-pathrecorder - Records mouse movements and sends path to callback when releasing mouse button.
BSD license.
by Sven Nilsen, 2012
http://www.cutoutpro.com

Version: 0.000 in angular degrees version notation
http://isprogrammingeasy.blogspot.no/2012/08/angular-degrees-versioning-notation.html

--]]

--[[
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the FreeBSD Project.
--]]

--[[

A path recorder register input data from the mouse and sends them to the callback
functon when the mouse is released. Then it resets the data so it can record a new path.

The path format is xyxyxyxyxyxyxyx...

--]]

local function PathRecorder(callbackFunction)
  local obj = {path = {}, active = false, callback = callbackFunction, button = "l"}
  
  function obj.Update()
    local mouseDown = love.mouse.isDown(obj.button)
    if not obj.active and not mouseDown then return end
    if obj.active and not mouseDown then
      -- Reset the path after sending it to the callback.
      obj.active = false
      if obj.callback then obj.callback(obj.path) end
      
      obj.path = {}
    end

    -- Get mouse coordinates.
    local mx, my = love.mouse.getX(), love.mouse.getY()
  
    local path = obj.path
    obj.active = true
    path[#path+1] = mx
    path[#path+1] = my
  end
  
  function obj.Draw()
    local path = obj.path
    for i = 1, #path-2, 2 do
      love.graphics.line(path[i], path[i+1], path[i+2], path[i+3])
    end
  end
  
  return obj
end

return PathRecorder
