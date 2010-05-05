
module("hello", package.seeall)

function run(wsapi_env)
  local headers = { ["Content-type"] = "text/html" }

  local function hello_text()
    DPrint('running!')
    coroutine.yield("<html><body>")
    coroutine.yield("<p>Hello Wsapi!</p>")
    coroutine.yield("<p>PATH_INFO: " .. wsapi_env.PATH_INFO .. "</p>")
    coroutine.yield("<p>SCRIPT_NAME: " .. wsapi_env.SCRIPT_NAME .. "</p>")
    coroutine.yield("<p>Type text here</p>")
    coroutine.yield("<textarea></textarea>")
    coroutine.yield("</body></html>")
  end

  return 200, headers, coroutine.wrap(hello_text)
end

return _M