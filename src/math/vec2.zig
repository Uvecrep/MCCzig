const std = @import("std");

// 2D Vector Mathematics

pub const Vec2Generic(comptime T: type) = struct {
    x: T,
    y: T,

    // Constructors

    pub fn zero() @This {
        return @This{ x: 0, y: 0 };
    }

    pub fn right() @This {
        return @This{ x: 1, y: 0 };
    }

    pub fn up() @This {
        return @This{ x: 0, y: 1 };
    }

    // Operations

    pub fn add(self: @This, other: @This) @This {
        return @This{
            x: self.x + other.x,
            y: self.y + other.y,
        };
    }

    pub fn addInPlace(self: *@This, other: @This) void {
        self.x += other.x;
        self.y += other.y;
    }

    pub fn sub(self: @This, other: @This) @This {
        return @This{
            x: self.x - other.x,
            y: self.y - other.y,
        };
    }

    pub fn subInPlace(self: *@This, other: @This) void {
        self.x -= other.x;
        self.y -= other.y;
    }

    pub fn mult(self: @This, scalar: T) @This {
        return @This{
            x: self.x * scalar,
            y: self.y * scalar,
        };
    }

    pub fn multInPlace(self: *@This, scalar: T) void {
        self.x *= scalar;
        self.y *= scalar;
    }

    pub fn div(self: @This, scalar: T) @This {
        if (scalar == 0) {
            return @This.zero();
        }
        return @This{
            x: self.x / scalar,
            y: self.y / scalar,
        };
    }

    pub fn divInPlace(self: *@This, scalar: T) void { 
        if (scalar == 0) {
            self.* = @This.zero();
            return;
        }
        self.x /= scalar;
        self.y /= scalar;
    }

    pub fn dot(self: @This, other: @This) T {
        return self.x * other.x + self.y * other.y;
    }

    pub fn cross(self: @This, other: @This) T {
        return self.x * other.y - self.y * other.x;
    }

    pub fn magnitude(self: @This) T {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }

    pub fn normalize(self: @This) @This {
        const mag = self.magnitude();
        if (mag == 0) {
            return @This.zero();
        }
        return @This{
            x: self.x / mag,    
            y: self.y / mag,
        };
    }

    pub fn distance(self: @This, other: @This) T {
        return (self.sub(other)).magnitude();
    }

    pub fn angle(self: @This, other: @This) T {
        return std.math.atan2(other.y, other.x) - std.math.atan2(self.y, self.x);
    }

    // Utility

    pub fn equals(self: @This, other: @This) bool {
        return self.x == other.x and self.y == other.y;
    }

    pub fn isZero(self: @This) bool {
        return self.x == 0 and self.y == 0;
    }

    pub fn format(self: @This(), comptime fmt: []const u8, options: std.fmt.FormatOptions, writer: anytype) !void {
        _ = fmt;
        _ = options;
        try writer.print("Vec2({d}, {d})", .{ self.x, self.y });
    }
};

// Vec2 Types

pub const Vec2f = Vec2Generic(f32);
pub const Vec2d = Vec2Generic(f64);
pub const Vec2i = Vec2Generic(i32);
pub const Vec2u8 = Vec2Generic(u8);
pub const Vec2u16 = Vec2Generic(u16);
pub const Vec2u32 = Vec2Generic(u32);
pub const Vec2u64 = Vec2Generic(u64);

pub const Vec2 = Vec2f; // Default type

// Tests

test "Vec2 Addition" {
    const a = Vec2{ x: 1, y: 2 };
    const b = Vec2{ x: 3, y: 4 };
    const result = a.add(b);
    try std.testing.expect(result.x == 4);
    try std.testing.expect(result.y == 6);
}

test "Vec2 Subtraction" {
    const a = Vec2{ x: 5, y: 6 };
    const b = Vec2{ x: 2, y: 3 };
    const result = a.sub(b);
    try std.testing.expect(result.x == 3);
    try std.testing.expect(result.y == 3);
}

test "Vec2 Multiplication" {
    const a = Vec2{ x: 2, y: 3 };
    const result = a.mult(2);
    try std.testing.expect(result.x == 4);
    try std.testing.expect(result.y == 6);
}

test "Vec2 Division" {
    const a = Vec2{ x: 8, y: 12 };
    const result = a.div(2);
    try std.testing.expect(result.x == 4);
    try std.testing.expect(result.y == 6);
}

test "Vec2 Dot Product" {
    const a = Vec2{ x: 1, y: 2 };
    const b = Vec2{ x: 3, y: 4 };
    const result = a.dot(b);
    try std.testing.expect(result == 11);
}

test "Vec2 Cross Product" {
    const a = Vec2{ x: 1, y: 2 };
    const b = Vec2{ x: 3, y: 4 };
    const result = a.cross(b);
    try std.testing.expect(result == -2);
}

test "Vec2 Magnitude" {
    const a = Vec2{ x: 3, y: 4 };
    const result = a.magnitude();
    try std.testing.expect(result == 5);
}

test "Vec2 Normalization" {
    const a = Vec2{ x: 6, y: 8 };
    const result = a.normalize();
    try std.testing.expect(result.x == 0.6);
    try std.testing.expect(result.y == 0.8);
}

test "Vec2 Distance" {
    const a = Vec2{ x: 1, y: 2 };
    const b = Vec2{ x: 4, y: 6 };
    const result = a.distance(b);
    try std.testing.expect(result == 5);
}

test "Vec2 Angle" {
    const a = Vec2{ x: 1, y: 0 };
    const b = Vec2{ x: 0, y: 1 };
    const result = a.angle(b);
    try std.testing.expect(result == std.math.pi / 2);
}