const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    

    const exe = b.addExecutable(.{
        .name = "MCCzig",
        .root_module = exe_mod,
    });

    const sdl_module = b.addModule("sdl", .{
        .root_source_file = b.path("src/sdl/bindings.zig"),
    });
    exe.root_module.addImport("sdl", sdl_module);
  
    const sdl2_path = "C:/tools/SDL2";
    exe.addIncludePath(.{ .cwd_relative = b.fmt("{s}/include", .{sdl2_path}) });

    const is_64 = target.result.cpu.arch == .x86_64;
    const lib_dir = b.fmt("{s}/lib/{s}", .{ sdl2_path, if (is_64) "x64" else "x86" });
    exe.addLibraryPath(.{ .cwd_relative = lib_dir });

    exe.linkSystemLibrary("sdl2");

    b.installArtifact(exe);
    
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const copy_dll = b.addInstallFile(
        .{ .cwd_relative = "C:/tools/SDL2/lib/x64/SDL2.dll" },
        "bin/SDL2.dll",
    );
    exe.step.dependOn(&copy_dll.step);

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
    const exe_unit_tests = b.addTest(.{
        .root_module = exe_mod,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_exe_unit_tests.step);
}
