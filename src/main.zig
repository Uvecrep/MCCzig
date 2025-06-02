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
