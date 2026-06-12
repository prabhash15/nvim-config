return {

  "echasnovski/mini.indentscope",
  version = "*",
  opts = function()
    local indentscope = require("mini.indentscope")
    return {
      symbol = "│",
      options = {
        -- This allows it to recognize the function header line as part of the scope body
        border = "both", 
        try_as_border = true,
      },
      draw = {
        delay = 100, -- milliseconds to wait before starting the animation
        animation = indentscope.gen_animation.linear({ 
          duration = 20, -- higher number = slower waterfall animation
          unit = "step"
        }),
      },
    }
  end,
}

