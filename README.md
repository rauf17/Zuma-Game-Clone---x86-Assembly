# Zuma-Game-Clone---x86-Assembly

# 🎮 Game Overview
ZUMBA is a classic fast-paced ball-shooting arcade game built from scratch in x86 Assembly language using the Irvine32 library. It simulates the iconic gameplay of Zuma — the player must eliminate a chain of colored balls before they reach the endpoint by launching and matching balls of the same color.

This project was a deep dive into low-level graphics, direct hardware interaction, and performance-focused game logic, all without the aid of modern game engines.

# 🧠 Gameplay & Mechanics
- 🌪️ The player controls a rotating cannon at the center of the screen.
- 🟢 Balls of various colors travel along a fixed path toward the endpoint.
- 🎯 The player must shoot balls to form groups of 3 or more matching colors to eliminate them.
- ⏳ The game becomes progressively harder, increasing the speed and ball variety.

# 🛠 Key Features
- 🖼️ Optimized Graphics Rendering
Direct pixel manipulation for smooth and fast visuals in real mode.
- 💾 Efficient Memory Usage
Manages game state using minimal stack and heap resources, ideal for Assembly constraints.
- 🎨 Color Matching Engine
Implements real-time collision detection and match logic between fired balls and chain.
- 📈 Score & High Score Tracking
Uses file I/O to record and persist scores across game sessions.
- ⌨️ Real-Time Input Handling
Interrupt-driven keyboard controls for precise ball shooting and direction adjustments.
- 🔥 Multiple Difficulty Levels
Speeds up gameplay and adds complexity as the player progresses through levels.

# 💻 Tech Stack
| Technology                | Purpose                                      |
| ------------------------- | -------------------------------------------- |
| x86 Assembly              | Core game logic and hardware-level control   |
| Irvine32 Library          | Graphics, input, and file I/O support        |
| DOSBox / EMU8086          | Runtime environment for testing              |
| Interrupts (INT 10h, 21h) | Screen rendering, keyboard and file handling |


# 🏁 How to Run
- Ensure you have an x86-compatible emulator (e.g., DOSBox, EMU8086, or MASM on Windows).
- Include the Irvine32 library and related .lib and .inc files in your project directory.

# 🎯 Learning Outcomes
- Deep understanding of memory management, interrupt handling, and graphics programming in Assembly.
- Experience designing a complete game loop, including input, rendering, state tracking, and file persistence.
- Sharpened skills in debugging low-level code and optimizing for performance.

# 📬 Contact
For questions or collaboration:
📧 connect2rauf17@gmail.com

