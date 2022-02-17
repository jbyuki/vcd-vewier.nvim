##vcd-viewer
@functions+=
function M.view()
  @get_lines_in_current_buffer
  @parse_vcd_file

  @open_scratch_buffer
  @foreach_waveform_draw_it
  @create_highlight_namespace
  @set_highlight_for_names
  @create_float_window
end

@get_lines_in_current_buffer+=
local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

@parse_vcd_file+=
local parsed, ordered = M.parse(lines)
