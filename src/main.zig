const std = @import("std");
const sdl = @import("sdl");
const wrappers = @import("sdl/wrappers.zig");

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    try bw.flush();

    try wrappers.init(sdl.consts.SDL_INIT_VIDEO | sdl.consts.SDL_INIT_AUDIO);
    defer wrappers.quit();
    

    const window: *sdl.types.SDL_Window = try wrappers.createWindow(
        "SDL2 Test", 100, 100, 1280, 720, sdl.consts.SDL_WINDOW_SHOWN
    );
    defer wrappers.destroyWindow(window);

    const renderer = try wrappers.createRenderer(window, -1, sdl.consts.SDL_RENDERER_ACCELERATED);
    defer wrappers.destroyRenderer(renderer);

    var event: sdl.types.SDL_Event = undefined;
    main_loop: while (true) {
        while (try wrappers.pollEvent(&event)) {
            switch (event.type) {
                sdl.consts.SDL_QUIT => {
                    std.debug.print("SDL_QUIT event received, exiting...\n", .{});
                    break :main_loop;
                },
                sdl.consts.SDL_KEYDOWN => {
                    const key = event.key.keysym.sym;
                    const mods = event.key.keysym.mod;

                    if (mods & sdl.consts.KMOD_SHIFT != 0 and key != sdl.consts.SDLK_LEFTSHIFT and key != sdl.consts.SDLK_RIGHTSHIFT) {
                        std.debug.print("Shift + ", .{});
                    }
                    else if (mods & sdl.consts.KMOD_CTRL != 0 and key != sdl.consts.SDLK_LEFTCONTROL and key != sdl.consts.SDLK_RIGHTCONTROL) {
                        std.debug.print("Ctrl  + ", .{});
                    }
                    else if (mods & sdl.consts.KMOD_ALT != 0 and key != sdl.consts.SDLK_LEFTALT and key != sdl.consts.SDLK_RIGHTALT) {
                        std.debug.print("Alt + ", .{});
                    }

                    switch (key) {
                        sdl.consts.SDLK_ESCAPE => {
                            std.debug.print("ESCAPE key pressed\n", .{});
                        },
                        sdl.consts.SDLK_LEFT => {
                            std.debug.print("Left Arrow pressed\n", .{});
                        },
                        sdl.consts.SDLK_RIGHT => {
                            std.debug.print("Right Arrow key pressed\n", .{});
                        },
                        sdl.consts.SDLK_UP => {
                            std.debug.print("Up Arrow key pressed\n", .{});
                        },
                        sdl.consts.SDLK_DOWN => {
                            std.debug.print("Down Arrow key pressed\n", .{});
                        },
                        sdl.consts.SDLK_SPACE => {
                            std.debug.print("SPACE key pressed\n", .{});
                        },
                        sdl.consts.SDLK_RETURN => {
                            std.debug.print("RETURN key pressed\n", .{});
                        },
                        sdl.consts.SDLK_BACKSPACE => {
                            std.debug.print("BACKSPACE key pressed\n", .{});
                        },
                        sdl.consts.SDLK_TAB => {
                            std.debug.print("TAB key pressed\n", .{});
                        },
                        sdl.consts.SDLK_LEFTCONTROL => {
                            std.debug.print("Left Control key pressed\n", .{});
                        },
                        sdl.consts.SDLK_RIGHTCONTROL => {
                            std.debug.print("Right Control key pressed\n", .{});
                        },
                        sdl.consts.SDLK_LEFTALT => {
                            std.debug.print("Left Alt key pressed\n", .{});
                        },
                        sdl.consts.SDLK_RIGHTALT => {
                            std.debug.print("Right Alt key pressed\n", .{});
                        },
                        sdl.consts.SDLK_LEFTSHIFT => {
                            std.debug.print("Left Shift key pressed\n", .{});
                        },
                        sdl.consts.SDLK_RIGHTSHIFT => {
                            std.debug.print("Right Shift key pressed\n", .{});
                        },                   
                        else => {},
                    }
                },
                sdl.consts.SDL_KEYUP => {
                    std.debug.print("KEYUP event detected\n", .{});
                },
                sdl.consts.SDL_MOUSEMOTION => {
                    std.debug.print("Mouse Motion event detected\n", .{});
                },
                sdl.consts.SDL_MOUSEBUTTONDOWN => {
                    std.debug.print("Mouse Button Down event detected\n", .{});
                }, 
                sdl.consts.SDL_MOUSEBUTTONUP => {
                    std.debug.print("Mouse Button Up event detected\n", .{});
                },
                sdl.consts.SDL_MOUSEWHEEL => {
                    std.debug.print("Mouse Wheel event detected\n", .{});
                },
                else => {},
            }
        }

        _ = try wrappers.setRenderDrawColor(renderer, 0, 0, 0, 255);
        _ = try wrappers.renderClear(renderer);

        _ = try wrappers.setRenderDrawColor(renderer, 255, 255, 255, 255);
        _ = try wrappers.renderDrawPoint(renderer, 640, 360);

        wrappers.renderPresent(renderer);

        wrappers.delay(16);
    }
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
