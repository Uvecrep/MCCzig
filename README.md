# MCCzig

A Zig project with SDL2 integration for multimedia applications.

## Overview

### Zig Creative Coding Environment Project

We've been discussing a resume-worthy project to learn Zig. The concept we're focusing on is:
A Cross-Platform GUI Application with Custom Rendering in Zig
Specifically, we're developing a minimal creative coding environment similar to Processing or p5.js, but built from scratch in Zig with these key components:
1. Custom GPU-accelerated rendering pipeline using Vulkan/Metal/OpenGL
2. Split-screen interface with code editor and visual output
3. Simple visual programming language for creative coding
4. Live coding experience with immediate visual feedback
5. Export capabilities for images and animations
The project demonstrates:
* Low-level graphics programming
* Language design/implementation
* Cross-platform development
* Custom UI implementation without frameworks
This serves as both a learning vehicle for Zig while creating something visually impressive and functional for your portfolio.

## Prerequisites

### Zig Compiler
- **Minimum Version:** Zig 0.15.0-dev.386+2e35fdd03 or later
- Download from: [https://ziglang.org/download/](https://ziglang.org/download/)

### SDL2 Library
This project requires SDL2 to be installed at `C:/tools/SDL2/` on Windows.

#### Windows Setup:
1. Download SDL2 development libraries from [https://www.libsdl.org/download-2.0.php](https://www.libsdl.org/download-2.0.php)
2. Extract the SDL2 folder to `C:/tools/SDL2/`
3. Ensure the directory structure looks like:
   ```
   C:/tools/SDL2/
   ├── include/
   ├── lib/
   │   ├── x64/
   │   │   ├── SDL2.dll
   │   │   └── SDL2.lib
   │   └── x86/
   └── ...
   ```

## Building the Project

### Build Commands

```bash
# Build the project
zig build

# Build and run the application
zig build run

# Run tests
zig build test

# Clean build artifacts
rm -rf zig-out/ .zig-cache/
```

### Build Options

The build system supports standard Zig build options:

```bash
# Build with different optimization levels
zig build -Doptimize=Debug     # Debug build (default)
zig build -Doptimize=ReleaseSafe
zig build -Doptimize=ReleaseFast
zig build -Doptimize=ReleaseSmall

# Cross-compile for different targets
zig build -Dtarget=x86_64-windows
zig build -Dtarget=x86-windows
```

## Project Structure

```
MCCzig/
├── build.zig          # Build configuration
├── build.zig.zon      # Package configuration
├── src/
│   ├── main.zig       # Main application entry point
│   └── sdl/           # SDL2 bindings
├── zig-out/           # Build output directory
└── .zig-cache/        # Zig build cache
```

## Development

### Running the Application
After building, the executable and required DLLs will be located in `zig-out/bin/`.

### Dependencies
- SDL2 library is automatically linked during the build process
- SDL2.dll is copied to the output directory for Windows execution

## Troubleshooting

### Common Issues

**SDL2 not found:**
- Ensure SDL2 is installed at `C:/tools/SDL2/`
- Verify the lib directory contains the correct architecture folders (x64/x86)

**Build errors:**
- Check that you're using the minimum required Zig version
- Ensure all SDL2 development files are properly installed

**Runtime errors:**
- Make sure SDL2.dll is in the same directory as the executable
- The build process should automatically copy this file to `zig-out/bin/` 

## MCCzig Project Roadmap

### Phase 1: Core Infrastructure (Current → Foundation)

Goals:

Create foundation to scale the rest of the project up from

DONE:
SDL2 integration and basic window management
Basic rendering setup
Expand SDL2 wrapper functions for input handling (keyboard, mouse)

TODO:
Add basic math utilities (vectors, matrices, color handling)
Create a resource management system (textures, fonts)

### Phase 2: Rendering Pipeline Enhancement

Goals:

Build a more sophisticated rendering system

TODO:

2D Graphics Foundation:
   Shape primitives (circles, rectangles, lines, polygons)
   Color and gradient systems
   Transform matrices (translate, rotate, scale)
   Blending modes and transparency
Text Rendering:
   Font loading and text rendering
   Different font sizes and styles
Advanced Graphics:
   Texture loading and sprite rendering
   Basic particle systems
   Frame buffer objects for offscreen rendering

### Phase 3: Split-Screen Interface Architecture

Goals:

Create the dual-pane interface (code editor + visual output)

TODO:

Window Management:
   Viewport system for splitting screen real estate
   Resizable panes with draggable dividers
   Input routing to appropriate panes
UI Framework Foundation:
   Basic UI elements (buttons, panels, text inputs)
   Event handling system
   Layout management

### Phase 4: Code Editor Implementation

Goals:

Build a functional code editor pane

Text Editor Core:
   Text buffer management
   Cursor handling and text selection
   Basic text editing operations (insert, delete, copy, paste)
Editor Features:
   Syntax highlighting for your visual language
   Line numbers and basic IDE features
   Undo/redo system
File Operations:
   Save/load sketch files
   File browser integration

### Phase 5: Visual Programming Language Design

Goals:

Create your custom language for creative coding

TODO:

Language Design:
   Define syntax (Processing-like vs more unique)
   Core graphics commands (draw shapes, set colors, etc.)
   Control structures (loops, conditionals)
   Variable and function systems
Parser/Interpreter:
   Tokenizer for your language
   Abstract Syntax Tree (AST) generation
   Interpreter that executes drawing commands
   Error handling and reporting

### Phase 6: Live Coding Integration

Goals:

Connect editor to real-time visual output

TODO:

Real-time Execution:
   Code parsing and execution on-the-fly
   Error visualization in the editor
   Performance optimization for smooth updates
Hot Reloading:
   Automatic re-execution on code changes
   State preservation where appropriate
   Smooth transition between code iterations

### Phase 7: Advanced Graphics & GPU Acceleration

Goals:

Implement the GPU-accelerated rendering

TODO:

Modern Graphics API:
   Choose between Vulkan/OpenGL/Metal based on platform
   Shader system for custom effects
   GPU-based particle systems and effects
Performance Optimization:
   Batch rendering for multiple objects
   GPU-based transformations
   Memory management for large scenes

### Phase 8: Export and Portfolio Features

Goals:

Make it portfolio-worthy with export capabilities

TODO:

Export System:
   Static image export (PNG, JPG)
   Animation/video export (GIF, MP4)
   High-resolution rendering
Portfolio Integration:
   Gallery of example sketches
   Screenshot/thumbnail generation
   Sharing capabilities
Documentation:
   Built-in help system
   Language reference
   Tutorial integration

### Phase 9: Cross-Platform Polish

Goals:

Ensure smooth operation across platforms

TODO:

Platform Optimization:
   Windows, macOS, Linux support
   Platform-specific UI conventions
   File system abstraction
Distribution:
   Installer/package creation
   Dependency bundling
   Version management