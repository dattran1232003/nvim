return {
  -- Inline git blame on current line
  {
    "f-person/git-blame.nvim",
    event = "BufReadPre",
    opts = {
      enabled = true,
      date_format = "%Y-%m-%d",
      message_when_not_committed = "Not committed yet",
      display_virtual_text = true,
      virtual_text_column = 80,
    },
  },
}
