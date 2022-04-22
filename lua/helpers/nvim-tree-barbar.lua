-- ref: https://github.com/romgrk/barbar.nvim#integration-with-filetree-plugins
local tree = {}

local view = require'nvim-tree.view'


tree.open = function (isFindFile)
   require'bufferline.state'.set_offset(31, 'FileTree')
   if isFindFile then
      require'nvim-tree'.find_file(true)
   else
      require'nvim-tree'.open()
   end
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree.view'.close()
end


tree.toggle = function(isFindFile)
  if view.is_visible() then
    tree.close()
  else
    tree.open(isFindFile)
  end

end

return tree
