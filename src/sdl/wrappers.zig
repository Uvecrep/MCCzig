const std = @import("std");
const sdl = @import("sdl");

pub fn init(subsystems: u32) !void {
    if (sdl.funcs.SDL_Init(subsystems) != 0) {
        std.log.err("SDL_Init failed: {s}\n", .{sdl.funcs.SDL_GetError()});
        return error.SDLInitFailed;
    }
    std.debug.print("SDL initialized successfully\n", .{});
}

pub fn quit() void {
    sdl.funcs.SDL_Quit();
}

pub fn createWindow(
    title: [*:0]const u8,
    x: i32, y: i32,
    w: i32, h: i32,
    flags: u32,
) !*sdl.types.SDL_Window {
    const ptr = sdl.funcs.SDL_CreateWindow(title, x, y, w, h, flags) orelse blk: {
        std.log.err("SDL_CreateWindow failed: {s}\n", .{sdl.funcs.SDL_GetError()});
        break :blk error.SDLCreateWindowFailed;
    };
    std.debug.print("SDL window created successfully\n", .{});
    return ptr;
}

pub fn destroyWindow(win: *sdl.types.SDL_Window) void {
    sdl.funcs.SDL_DestroyWindow(win);
}

pub fn createRenderer(
    window: *sdl.types.SDL_Window,
    index: i32,
    flags: u32,
) !*sdl.types.SDL_Renderer {
    const ptr = sdl.funcs.SDL_CreateRenderer(window, index, flags) orelse blk: {
        std.log.err("SDL_CreateRenderer failed: {s}\n", .{sdl.funcs.SDL_GetError()});
        break :blk error.SDLCreateRendererFailed;
    };
    std.debug.print("SDL renderer created successfully\n", .{});
    return ptr;
}

pub fn destroyRenderer(renderer: *sdl.types.SDL_Renderer) void {
    sdl.funcs.SDL_DestroyRenderer(renderer);
}

pub fn setRenderDrawColor(
    renderer: *sdl.types.SDL_Renderer,
    r: u8, g: u8, b: u8, a: u8,
) !void {
    if (sdl.funcs.SDL_SetRenderDrawColor(renderer, r, g, b, a) != 0) {
        std.log.err("SDL_SetRenderDrawColor failed: {s}\n", .{sdl.funcs.SDL_GetError()});
        return error.SDLSetRenderDrawColorFailed;
    }
}

pub fn renderClear(renderer: *sdl.types.SDL_Renderer) !void {
    if (sdl.funcs.SDL_RenderClear(renderer) != 0) {
        std.log.err("SDL_RenderClear failed: {s}\n", .{sdl.funcs.SDL_GetError()});
        return error.SDLRenderClearFailed;
    }
}

pub fn renderPresent(renderer: *sdl.types.SDL_Renderer) void {
    sdl.funcs.SDL_RenderPresent(renderer);
}

pub fn renderDrawPoint(
    renderer: *sdl.types.SDL_Renderer,
    x: i32, y: i32,
) !void {
    if (sdl.funcs.SDL_RenderDrawPoint(renderer, x, y) != 0) {
        std.log.err("SDL_RenderDrawPoint failed: {s}\n", .{sdl.funcs.SDL_GetError()});
        return error.SDLRenderDrawPointFailed;
    }
}

pub fn pollEvent(event: *sdl.types.SDL_Event) !bool {
    const result = sdl.funcs.SDL_PollEvent(event);
    if (result < 0){
        std.log.err("SDL_PollEvent failed: {s}\n", .{sdl.funcs.SDL_GetError()});
        return error.SDLPollEventFailed;
    }
    return result != 0;
}

pub fn delay(ms: u32) void {
    sdl.funcs.SDL_Delay(ms);
}

pub fn getError() [*:0]const u8 {
    return sdl.funcs.SDL_GetError();
}

test "SDL init succeeds on 0" {
    // Temporarily override SDL_Init to simulate failure
    const original = sdl.funcs.SDL_Init;
    defer sdl.funcs.SDL_Init = original;

    sdl.funcs.SDL_Init = struct {
        pub fn SDL_Init(_: u32) c_int {
            return 0;
        }
    }.SDL_Init;

    const result = init(sdl.consts.SDL_INIT_VIDEO);
    try std.testing.expectEqual(null, result);
}

test "SDL init fails gracefully" {
    // Temporarily override SDL_Init to simulate failure
    const original = sdl.funcs.SDL_Init;
    defer sdl.funcs.SDL_Init = original;

    sdl.funcs.SDL_Init = struct {
        pub fn SDL_Init(_: u32) c_int {
            return -1;
        }
    }.SDL_Init;

    const result = init(sdl.consts.SDL_INIT_VIDEO);
    try std.testing.expectError(error.SDLInitFailed, result);
}

