const std = @import("std");

// Color Mathematics

//TODO: Color struct, Color space conversion (RGB, HSV, HSL), Color interpolation, predefined constants\

pub const ColorGeneric(comptime T: type) = struct {
    r: T,
    g: T,
    b: T,
    a: T,

    // Constructors

    pub fn rgb(r: T, g: T, b: T) @This {
        const max_alpha = if (T == f32) 1.0 else if (T == u8) 255 else @compileError("Invalid type");
        return @This{ .r = r, .g = g, .b = b, .a = max_alpha };
    }

    pub fn rgba(r: T, g: T, b: T, a: T) @This {
        return @This{ .r = r, .g = g, .b = b, .a = a };
    }

    pub fn hsv(h: T, s: T, v: T) @This {
    // // TODO: Implement HSV to RGB conversion
    // // https://cs.stackexchange.com/questions/64549/convert-hsv-to-rgb-colors
    //     // Assumes: h = 0-360°, s = 0-1, v = 0-1 (for f32)
    //     // or h = 0-360, s = 0-100, v = 0-100 (for integer types)
        
    //     const c = v * s;  // Chroma
    //     const h_prime = h / 60.0;  // Sector (0-6)
    //     const x = c * (1.0 - @abs(@mod(h_prime, 2.0) - 1.0));
    //     const m = v - c;
        
    //     var r1: T = 0;
    //     var g1: T = 0; 
    //     var b1: T = 0;
        
    //     if (h_prime >= 0 and h_prime < 1) {
    //         r1 = c; g1 = x; b1 = 0;
    //     } else if (h_prime >= 1 and h_prime < 2) {
    //         r1 = x; g1 = c; b1 = 0;
    //     } else if (h_prime >= 2 and h_prime < 3) {
    //         r1 = 0; g1 = c; b1 = x;
    //     } else if (h_prime >= 3 and h_prime < 4) {
    //         r1 = 0; g1 = x; b1 = c;
    //     } else if (h_prime >= 4 and h_prime < 5) {
    //         r1 = x; g1 = 0; b1 = c;
    //     } else if (h_prime >= 5 and h_prime < 6) {
    //         r1 = c; g1 = 0; b1 = x;
    //     }
        
    //     return @This{
    //         .r = r1 + m,
    //         .g = g1 + m,
    //         .b = b1 + m,
    //         .a = 1.0,  // or appropriate max value
    //     };
        return;
    }

    pub fn hsva(h: T, s: T, v: T, a: T) @This {
        // TODO: Implement HSVA to RGBA conversion
        return;
    }

    pub fn hex(hex_value: u32) @This {
        // TODO: Implement hex to RGB conversion
        return;
    }
    
    // want a function here to swap between float and int versions of the Color object

    // Color Space Conversions

    pub fn rgbToHsv(self: @This) @This {
        // TODO: Implement RGB to HSV conversion
        // https://cs.stackexchange.com/questions/64549/convert-hsv-to-rgb-colors
        return;
    }
    
    pub fn rgbToHex(self: @This) u32 {
        // TODO: Implement RGB to hex conversion
        return;
    }
    
    // Color Operations

    pub fn lerp(self: @This, other: @This, t: T) @This {
        // TODO: Implement linear interpolation
        return;
    }

    pub fn mix(self: @This, other: @This, t: T) @This {
        // TODO: Implement color mixing
        return;
    }

    pub fn lighten(self: @This, amount: T) @This {
        // TODO: Implement color lightening
        return;
    }

    pub fn darken(self: @This, amount: T) @This {
        // TODO: Implement color darkening
        return;
    }
    
    pub fn saturate(self: @This, amount: T) @This {
        // TODO: Implement color saturation
        return;
    }

    pub fn desaturate(self: @This, amount: T) @This {
        // TODO: Implement color desaturation
        return;
    }    

    // Utility

    pub fn format(self: @This, comptime fmt: []const u8, options: std.fmt.FormatOptions, writer: anytype) !void {
        _ = fmt;
        _ = options;
        try writer.print("Color({d}, {d}, {d}, {d})", .{ self.r, self.g, self.b, self.a });
    }
    
};

// Color Types

pub const Color = ColorGeneric(f32); // 0.0 - 1.0
pub const Color8 = ColorGeneric(u8); // 0 - 255

// Predefined Colors



// Tests


