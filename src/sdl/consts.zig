// SDL2 constants //

// Event Types

pub const SDL_QUIT = 0x100;
pub const SDL_KEYDOWN = 0x300;
pub const SDL_KEYUP = 0x301;

// Key Codes

// Simple Keys (ASCII)
pub const SDLK_ESCAPE = 0x1b;
pub const SDLK_SPACE = 0x20;
pub const SDLK_RETURN = 0x0d;
pub const SDLK_BACKSPACE = 0x08;
pub const SDLK_TAB = 0x09;

// Key Modifiers

pub const KMOD_NONE = 0x0000;
pub const KMOD_LSHIFT = 0x0001;
pub const KMOD_RSHIFT = 0x0002;
pub const KMOD_LCTRL = 0x0040;
pub const KMOD_RCTRL = 0x0080;
pub const KMOD_LALT = 0x0100;
pub const KMOD_RALT = 0x0200;
pub const KMOD_LGUI = 0x0400;
pub const KMOD_RGUI = 0x0800;

// Convenience Masks
pub const KMOD_CTRL = KMOD_LCTRL | KMOD_RCTRL;
pub const KMOD_SHIFT = KMOD_LSHIFT | KMOD_RSHIFT;
pub const KMOD_ALT = KMOD_LALT | KMOD_RALT;
pub const KMOD_GUI = KMOD_LGUI | KMOD_RGUI;

// Extended Keys
pub const SDLK_LEFT = 0x40000050;
pub const SDLK_RIGHT = 0x4000004f;  
pub const SDLK_UP = 0x40000052;
pub const SDLK_DOWN = 0x40000051;
pub const SDLK_LEFTCONTROL = 0x400000e0;
pub const SDLK_RIGHTCONTROL = 0x400000e4;
pub const SDLK_LEFTALT = 0x400000e2;
pub const SDLK_RIGHTALT = 0x400000e6;
pub const SDLK_LEFTSHIFT = 0x400000e1;
pub const SDLK_RIGHTSHIFT = 0x400000e5;

// Mouse Buttons

pub const SDL_BUTTON_LEFT = 1;
pub const SDL_BUTTON_MIDDLE = 2;
pub const SDL_BUTTON_RIGHT = 3;
pub const SDL_MOUSEMOTION = 0x400;
pub const SDL_MOUSEBUTTONDOWN = 0x401;
pub const SDL_MOUSEBUTTONUP = 0x402;
pub const SDL_MOUSEWHEEL = 0x403;

// Renderer Flags

pub const SDL_RENDERER_ACCELERATED = 0x00000002;
pub const SDL_WINDOW_SHOWN = 0x00000004;
pub const SDL_INIT_AUDIO = 0x00000010;
pub const SDL_INIT_VIDEO = 0x00000020;