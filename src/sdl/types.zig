pub const SDL_Window = opaque {};
pub const SDL_Renderer = opaque {};

pub const SDL_Keycode = i32;

// SDL Event Union
pub const SDL_Event = extern union {
    type: u32,
    key: SDL_KeyboardEvent,
    button: SDL_MouseButtonEvent,
    motion: SDL_MouseMotionEvent,
    padding: [56]u8,
};

// SDL Keyboard Event
pub const SDL_KeyboardEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    state: u8,
    repeat: u8,
    padding: [2]u8,
    keysym: SDL_Keysym,
};

// SDL Mouse Button Event
pub const SDL_MouseButtonEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    which: u32,
    button: u8,
    state: u8,
    clicks: u8,
    padding1: [8]u8,
    x: i32,
    y: i32,
};

// SDL Mouse Motion Event
pub const SDL_MouseMotionEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    which: u32,
    state: u32,
    x: i32,
    y: i32,
    xrel: i32,
    yrel: i32,
};

// SDL Keysym
pub const SDL_Keysym = extern struct {
    scancode: SDL_Scancode,
    sym: SDL_Keycode,
    mod: u16,
    unused: u32,
};

// SDL Scancode
pub const SDL_Scancode = enum(c_int) {
    SDL_SCANCODE_UNKNOWN = 0,
    SDL_SCANCODE_RETURN = 40,
    SDL_SCANCODE_ESCAPE = 41,
    SDL_SCANCODE_BACKSPACE = 42,
    SDL_SCANCODE_TAB = 43,
    SDL_SCANCODE_SPACE = 44,
    SDL_SCANCODE_LEFT = 75,
    SDL_SCANCODE_RIGHT = 77,
    SDL_SCANCODE_UP = 82,
    SDL_SCANCODE_DOWN = 81,
};
    
    
    
