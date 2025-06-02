pub const SDL_Window = opaque {};
pub const SDL_Renderer = opaque {};
pub const SDL_Event = extern struct {
    type: u32,
    padding: [56]u8,
};