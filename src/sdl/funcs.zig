const types = @import("types.zig");

pub extern fn SDL_Init(flags: u32) c_int;
pub extern fn SDL_Quit() void;
pub extern fn SDL_GetError() [*:0]const u8;
pub extern fn SDL_PollEvent(event: *types.SDL_Event) c_int;
pub extern fn SDL_DestroyWindow(window: *types.SDL_Window) void;
pub extern fn SDL_Delay(ms: u32) void;
pub extern fn SDL_DestroyRenderer(renderer: *types.SDL_Renderer) void;
pub extern fn SDL_SetRenderDrawColor(renderer: *types.SDL_Renderer, r: u8, g: u8, b: u8, a: u8) c_int;
pub extern fn SDL_RenderClear(renderer: *types.SDL_Renderer) c_int;
pub extern fn SDL_RenderPresent(renderer: *types.SDL_Renderer) void;
pub extern fn SDL_RenderDrawPoint(renderer: *types.SDL_Renderer, x: c_int, y: c_int) c_int;
pub extern fn SDL_CreateWindow(
    title: [*:0]const u8,
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
    flags: u32,
) ?*types.SDL_Window;
pub extern fn SDL_CreateRenderer(
    window: *types.SDL_Window,
    index: c_int,
    flags: u32,
) ?*types.SDL_Renderer;