 local nt_okay, nvim_tree = pcall(require, "nvim-tree")
 if not nt_okay then
   vim.notify("Failed to fetch nvim-tree.")
   return
 end


 nvim_tree.setup {
   disable_netrw = true,
   open_on_tab = false,
   hijack_cursor = false,
   update_cwd = true,

   hijack_directories = {
     enable = true,
     auto_open = true,
   },

   diagnostics = {
     enable = false,
     icons = {
       hint = "",
       info = "",
       warning = "",
       error = "",
     },
   },

   filters = {
     git_ignored = false,
     dotfiles = false,
     git_clean = false,
     no_buffer = false,
     custom = {},
     exclude = {},
   },

   update_focused_file = {
     enable = true,
     update_cwd = true,
     ignore_list = {},
   },

   git = {
     enable = true,
     ignore = true,
     timeout = 500,
   },

   view = {
     width = 35,
     side = "left",
     number = false,
     relativenumber = false,
   },

   ui = {
     confirm = {
       remove = true,
       trash = true,
       default_yes = false,
     },
   },

   renderer = {
     highlight_git = true,
     --root_folder_modifier = ":t",

     icons = {
       show = {
         file = true,
         folder = true,
         folder_arrow = true,
         git = true,
       },

       glyphs = {
         default = "",
         symlink = "",
         git = {
           unstaged = "",
           staged = "S",
           unmerged = "",
           renamed = "➜",
           deleted = "",
           untracked = "U",
           ignored = "◌",
         },

         folder = {
           default = "",
           open = "",
           empty = "",
           empty_open = "",
           symlink = "",
         },
       }
     }
   },

   actions = {
     open_file = {
       quit_on_open = false,
       eject = true,
       resize_window = true,

       window_picker = {
         enable = true,
         picker = "default",
         chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
         
         exclude = {
           filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
           buftype = { "nofile", "terminal", "help" },
         },
       },
     },
   }
 }
